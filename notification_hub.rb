require 'valid_email'

class NotificationHub
  private
  def initialize()
    @notifications = []
  end

  def validate_input(to:, about:)
    errors = []
    errors.push "Invalid email address" if ValidateEmail.valid?(to) == false
    errors.push "Invalid subject" if about.nil?
    return errors
  end

  public
  def notify(to:, about:, with:)
    errors = validate_input to: to, about: about
    return { success: false, errors: errors } unless errors.size == 0

    @notifications.push({to: to, about: about, with: with})

    return { success: true }
  end

  def show_notifications(for_user:)
    @notifications.select {|notification| notification[:to] == for_user}
  end

end