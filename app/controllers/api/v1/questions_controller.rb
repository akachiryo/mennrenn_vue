class Api::V1::QuestionsController < ApplicationController
  def index
    question = Question.all
    render json: question, each_serializer: QuestionSerializer
  end

  def create
    question = Question.new(question_params)
    question.save!
    redirect_to  api_v1_question_types_path
  end

  def destroy
  end

  private

  def question_params
    params.require(:question).permit(:question_type_id, :content)
  end
end
