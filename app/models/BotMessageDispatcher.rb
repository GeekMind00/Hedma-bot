require './app/models/BotCommand'

# This class manages which bot command should respond to the user message. 
class BotMessageDispatcher
    attr_reader :message, :user

    # This constant defines the availabe bot commands.
    AVAILABLE_COMMANDS = [
    BotCommand::Start,
    BotCommand::Shirts,
    BotCommand::Pants,
    BotCommand::Shoes
    ]
    
    # This method initializes the message hash that the user sent and a user activeRecord as a instance variables.
    def initialize(message, user)
    @message = message
    @user = user
    end
     
    # This method is responsible for determining which available bot command should respond to the user message, and if none found it fires the undefined class instance to tell the user to enter a valid command.
    def process
    if command = AVAILABLE_COMMANDS.find { |command_class| command_class.new(@user, @message).should_start? }
    command.new(@user, @message).start
    else
    BotCommand::Undefined.new(@user, @message).start
    end
    end
    end