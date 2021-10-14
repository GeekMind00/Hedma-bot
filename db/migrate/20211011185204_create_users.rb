class CreateUsers < ActiveRecord::Migration[6.1]
 
  def change
    create_table :users do |t|
   
      t.string :telegram_id
      t.string :first_name
      t.string :last_name
      t.string :step
      t.timestamps
    end
  
 
  end
end
