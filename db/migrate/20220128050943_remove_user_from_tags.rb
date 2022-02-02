class RemoveUserFromTags < ActiveRecord::Migration[6.0]
  def change
    remove_foreign_key :tags, :users
    remove_reference :tags, :users, index: true
  end
end
