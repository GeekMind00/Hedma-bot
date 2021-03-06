class WebhooksController < ApplicationController
    skip_before_action :verify_authenticity_token

    def webhookCallback
    @room_message = RoomMessage.new(user_id: user[:id],messageType:'text',message: webhook[:message][:text],direction: 'from')
    @room_message.save
    SendMessageJob.perform_later(@room_message)
    dispatcher.new(webhook, user).process

    head :ok
    end
    
    def webhook
    params['webhook']
    end
    
    def dispatcher
    BotMessageDispatcher
    end
    
    def from
    webhook[:message][:from]
    end
    
    def user
    @user ||= (::User.find_by(telegram_id: from[:id]) || register_user)
    end
    
    def register_user
    @user = User.find_or_initialize_by(telegram_id: from[:id])
    
    @user.update(first_name: from[:first_name], last_name: from[:last_name])
    end
    end