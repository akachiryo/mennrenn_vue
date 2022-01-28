class CreateRoomTags < ActiveRecord::Migration[6.0]
  def change
    create_table :room_tags do |t|
      t.references :room, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true

      t.timestamps
      t.index [:room_id, :tag_id], unique: true
    end
  end
end
