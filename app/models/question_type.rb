class QuestionType < ApplicationRecord
  has_many :question_types, dependent: :destroy
  validates :name, presence: true, uniqueness: true
end
