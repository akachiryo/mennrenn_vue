class  Api::V1::QuestionTypesController < ApplicationController
  def create
    question_type = QuestionType.new(question_type_params)
    question_type.save!
  end

  def destroy
  end

  private 
    def question_type_params
      params.require(:question_type).permit(:content)
    end
end
