class AnswersController < ApplicationController
  def create
    @answer = Answer.new(answer_params)

    if @answer.save
      render json: @answer
    else
      render json: @answer.errors, status: :bad_request
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:content, :question_id)
  end
end
