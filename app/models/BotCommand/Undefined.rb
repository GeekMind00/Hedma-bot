module BotCommand
    # This class defines the Undefined bot command that is responsible for prompting the user when he send an invalid command.
    class Undefined < Base

    def should_start?
       
    end

    # This method prompts the user that he entered an invalid command through telegram API.
    def start
    send_message('Please enter a valid command!')
    end
    end
    end