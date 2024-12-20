require 'spec_helper'
require_relative '../notification_hub'

RSpec.describe 'NotificationHub' do
  
  context 'received a valid request' do
    it 'creates a notification out of it' do
      hub = NotificationHub.new
      hub.notify to:'someone@acme.com', about:'Vacations approval required', with: {approve:'https://www.vacations.com/approve?request=1', reject: 'https://www.vacations.com/reject?request=2'}
      notifications = hub.show_notifications for_user:'someone@acme.com'
      expect(notifications.size).to eq 1 
    end
    it 'responds ok' do
    end
  end

  context 'received an invalid request' do
    it 'responds bad request' do
    end
  end

end
  
