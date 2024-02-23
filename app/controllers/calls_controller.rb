# app/controllers/calls_controller.rb
class CallsController < ApplicationController
  def create
    recipient_id = params[:recipient_id]
    if recipient_id.present?
      current_user.calls.create_call(current_user.id, recipient_id)
      ActionCable.server.broadcast("voip_channel_#{recipient_id}", { message: "Incoming call..." })
      redirect_to user_path(recipient_id), notice: "Call initiated successfully."
    else
      redirect_back(fallback_location: root_path, alert: "Recipient not specified.")
    end
  end
end
