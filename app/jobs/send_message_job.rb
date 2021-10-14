class SendMessageJob < ApplicationJob
  queue_as :default
  def perform(room_message)
    if(room_message.messageType=='photo')
      message = ApplicationController.render(
        partial: 'room_messages/adminPhoto',
        locals: { message: room_message.message }
      )
    elsif(room_message.direction=='to')
      message = ApplicationController.render(
        partial: 'room_messages/adminMessage',
        locals: { message: room_message.message }
      )
    else
      message = ApplicationController.render(
        partial: 'room_messages/userMessage',
        locals: { message: room_message.message }
      )
    end
  ActionCable.server.broadcast "user_channel_#{room_message.user_id}", {message: message}
  end
end