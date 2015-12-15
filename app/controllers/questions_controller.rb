class QuestionsController < ApplicationController
  def index
    @questions = Question.all
    @answers = Answer.all
  end

  def show
    Question.increment_counter(:views, params[:id])
    @question = Question.find(params[:id])
    @answers = Answer.where(question_id: params[:id])
  end

  def create
    @question = Question.new(question_params)

    if @question.save
      render json: @question
    else
      render json: @question.errors, status: :bad_request
    end
  end

  private

  def question_params
    params.require(:question).permit(:title, :content)
  end

end
