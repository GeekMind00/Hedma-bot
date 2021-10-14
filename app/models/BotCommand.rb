require 'telegram/bot'

# This module defines the basic commands that a bot command should have.
module BotCommand
class Base
attr_reader :user, :message, :api
 
def initialize(user, message)
@user = user
@message = message
token = Rails.application.credentials.bot_token
@api = Telegram::Bot::Api.new(token)
end
 
def should_start?
raise NotImplementedError
end
 
def start
raise NotImplementedError
end
 
protected

# This method sends a text message to the telegram api, saves it to the DB and perform a job to preview it in real-time manner on the webpage.
def send_message(text, options={})
@api.sendMessage( chat_id: @user[:telegram_id], text: text)
@room_message = RoomMessage.new(user_id: @user[:id],messageType:'text',message: text,direction: 'to')
@room_message.save
SendMessageJob.perform_later(@room_message)
end

# This method sends a photo message to the telegram api, saves it to the DB and perform a job to preview it in real-time manner on the webpage.
def send_photo(photo, options={})
    @api.sendPhoto( chat_id: @user[:telegram_id], photo: photo[:remote])
    @room_message = RoomMessage.new(user_id: @user[:id],messageType:'photo',message: photo[:local],direction: 'to')
    @room_message.save
    SendMessageJob.perform_later(@room_message)
    end
 
# This method returns the message the user sent to the bot
def text
@message[:message][:text]
end

# This method returns the from which contains telegram_id, first and last name of the user sent the message. 
def from
@message[:message][:from]
end
end
end