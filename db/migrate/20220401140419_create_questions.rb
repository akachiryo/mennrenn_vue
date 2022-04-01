class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.references :question_type, null: false, foreign_key: true
      t.text :content, presence: true
      
      t.timestamps
    end
  end
end
