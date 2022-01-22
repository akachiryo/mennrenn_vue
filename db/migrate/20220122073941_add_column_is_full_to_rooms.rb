class AddColumnIsFullToRooms < ActiveRecord::Migration[6.0]
  def change
    add_column :rooms, :is_full, :boolean, default: false, null: false
  end
end
