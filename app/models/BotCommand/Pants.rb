module BotCommand
    # This class defines the "/pants" bot command that is responsible for viewing availabe pants from the item activeRecord in the DB.
    class Pants < Base

    # This method decides whether the text message that the user sent matches the "/pants" command.
    def should_start?
    text == '/pants'
    end
     
    # This method replies to the user with the availabe pants pics through telegram API.
    def start
    send_message('Which pants do you like, dear customer?')
 
    @items=Item.where("itemType = ?", "pants")
    @items.each do |item|
        send_photo({remote: item[:remotePath],local:item[:localPath]})
    end
    user.reset_next_bot_command
    end
    end
    end