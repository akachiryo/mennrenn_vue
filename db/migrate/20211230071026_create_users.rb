class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name, presence: true
      t.string :email, presence: true, uniqueness: true
      t.string :password_digest, presence: true

      t.timestamps
    end
  end
end
