class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :itemType
      t.string :localPath
      t.string :remotePath
      t.timestamps
    end
  end
end
