class QuestionType < ApplicationRecord
  has_many :questions, dependent: :destroy
  validates :content, presence: true, uniqueness: true
end
