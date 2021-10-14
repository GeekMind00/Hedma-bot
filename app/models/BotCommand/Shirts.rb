module BotCommand
    # This class defines the "/shirts" bot command that is responsible for viewing availabe shirts from the item activeRecord in the DB.
    class Shirts < Base

    # This method decides whether the text message that the user sent matches the "/shirts" command.
    def should_start?
    text == '/shirts'
    end
    
    # This method replies to the user with the availabe shirts pics through telegram API.
    def start
    send_message('Which shirt do you like, dear customer?')
    @items=Item.where("itemType = ?", "shirts")
    @items.each do |item|
        send_photo({remote: item[:remotePath],local:item[:localPath]})
    end
    user.set_next_bot_command('pants')
    end
    end
    end