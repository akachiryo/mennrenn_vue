class QuestionTypeSerializer < ActiveModel::Serializer
  attributes :id,
             :content

  has_many :questions
end
