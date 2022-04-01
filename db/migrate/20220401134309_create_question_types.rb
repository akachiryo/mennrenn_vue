class CreateQuestionTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :question_types do |t|
      t.string :content, presence: true
      t.timestamps
    end
  end
end
