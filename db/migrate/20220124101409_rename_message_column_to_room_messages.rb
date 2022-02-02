class RenameMessageColumnToRoomMessages < ActiveRecord::Migration[6.0]
  def change
    rename_column :room_messages, :message, :content
  end
end
