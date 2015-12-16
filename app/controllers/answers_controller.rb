class AnswersController < ApplicationController
  def create
    @answer = Answer.new(answer_params)

    if @answer.save
      render json: @answer
    else
      render json: @answer.errors, status: :bad_request
    end
  end

  def update
    if params[:vote] == "1"
      Answer.increment_counter(:votes, params[:id])
    elsif params[:vote] == "-1"
      Answer.decrement_counter(:votes, params[:id])
    end
    render json: Answer.find(params[:id])
  end

  private

  def answer_params
    params.require(:answer).permit(:content, :question_id, :votes)
  end
end
