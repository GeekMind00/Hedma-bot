module BotCommand
    # This class defines the "/start" bot command that is responsible for welcoming the user and starting the conversation.
    class Start < Base
    
    # This method decides whether the text message that the user sent matches the "/start" command.
    def should_start?
    text=='/start'
    end
     
    # This method replies to the user with the welcoming message through telegram API.
    def start
    send_message('Hello! Welcome to Hedma store🥰')
    send_message('Which item do you want to buy, dear customer?')
    user.set_next_bot_command('pants')
    end
    end
    end