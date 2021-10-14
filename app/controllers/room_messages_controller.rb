require 'telegram/bot'

# This class defines the RoomMessages controller, which is responsible for viewing the chat room, send messages to the telegram api, perform actionCable job to enable real-time connection.
class RoomMessagesController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action :load_entities


    # This method is responsible for viewing a certain room containing certain messages to and from specific user.
    def show 
    end

    # This method is responsible for:
    # 1- creating a message and saving it to the DB.
    # 2- performing a sendMessage job to enable actionCable to run in the background, which provide a real-time chat.
    # 3- sending messages from the webpage to the user through telegram API.
    def create
        @room_message = RoomMessage.new(user_id: params[:user_id],messageType:'text',message: params[:content],direction: 'to')
        @room_message.save

        SendMessageJob.perform_later(@room_message)
        
        token = Rails.application.credentials.bot_token
        @api = Telegram::Bot::Api.new(token)
        @user=User.find(params[:user_id])
        puts @user[:telegram_id]
        @api.sendMessage( chat_id: @user[:telegram_id], text: params[:content])

    end

    protected
  
    # This method is responsible for querying the Users and RoomMessages activeRecords from the DB before any action. 
    def load_entities
      @users = User.all
      @room_messages = RoomMessage.where("user_id = ?", params[:id]).order(:created_at)
      @user=User.find(params[:id])
    end
end
