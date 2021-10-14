class CreateRoomMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :room_messages do |t|
      t.belongs_to :user
      t.string :messageType
      t.string :message
      t.string :direction

      t.timestamps
    end
  end
end
