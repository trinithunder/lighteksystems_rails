class VoipChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    stream_from "voip_channel_#{current_user.id}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def receive(data)
    # Handle incoming data (e.g., VoIP call request)
    ActionCable.server.broadcast("voip_channel_#{data['recipient_id']}", data)
  end

  def disconnect
    # Handle client disconnect
    stop_all_streams
  end
end
