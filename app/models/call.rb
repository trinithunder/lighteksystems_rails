# app/models/call.rb
class Call < ApplicationRecord
  belongs_to :caller, class_name: 'User'
  belongs_to :recipient, class_name: 'User'
  # Add any other relevant associations and validations

  def self.create_call(caller_id, recipient_id)
    # Logic to create a new call record
    Call.create(caller_id: caller_id, recipient_id: recipient_id)
  end
end
