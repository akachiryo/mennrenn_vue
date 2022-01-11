class ChangeTitleOnRoom < ActiveRecord::Migration[6.0]
  def change
    change_column_null :rooms, :title, false
  end
end
