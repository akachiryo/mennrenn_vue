class QuestionSerializer < ActiveModel::Serializer
  attributes :id,
             :content

  belongs_to :question_type
end
