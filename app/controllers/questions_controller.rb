class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
    @answers = Answer.all
  end

  def create
    @question = Question.new(question_params)

    if @question.save
      render json: @question
    else
      render json: @question.errors, status: :bad_request
    end
  end

  def answers

  end

  private

  def question_params
    params.require(:question).permit(:title, :content)
  end

end
