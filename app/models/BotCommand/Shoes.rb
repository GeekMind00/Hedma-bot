module BotCommand
    # This class defines the "/shoes" bot command that is responsible for viewing availabe shoes from the item activeRecord in the DB.
    class Shoes < Base
    
    # This method decides whether the text message that the user sent matches the "/shoes" command.
    def should_start?
    text =='/shoes'
    end
    
    # This method replies to the user with the availabe shoes pics through telegram API.
    def start
    send_message('Which shoes do you like, dear customer?')
    @items=Item.where("itemType = ?", "shoes")
    @items.each do |item|
        send_photo({remote: item[:remotePath],local:item[:localPath]})
    end
    user.set_next_bot_command('Pants')
    end
    end
    end