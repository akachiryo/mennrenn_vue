class  Api::V1::QuestionTypesController < ApplicationController

  def index
    question_types = QuestionType.all
    render json: question_types, each_serializer: QuestionTypeSerializer
  end

  def create
    question_type = QuestionType.new(question_type_params)
    question_type.save!
  end

  def destroy
    question_type = QuestionType.find(params[:id])
    question_type.destroy!
  end

  private 
    def question_type_params
      params.require(:question_type).permit(:content)
    end
end
