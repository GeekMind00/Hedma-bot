class User < ApplicationRecord
    validates_uniqueness_of :telegram_id
    has_many :room_messages
    
    def set_next_bot_command(command)
        self.step = command
        save
    end
         
    def get_next_bot_command
        self.step
    end
         
    def reset_next_bot_command
        self.step = {}
        save
    end
end
