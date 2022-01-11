class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
