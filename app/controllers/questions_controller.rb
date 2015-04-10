class QuestionsController < ApplicationController
  skip_before_action :authenticate, only: [:show, :index]

  def index
    @questions = Question.order(created_at: :desc)
  end

  def show
    @question = Question.find(params[:id])
  end

  def new
    @question = Question.new
  end

  def create
   @question = current_user.questions.create(question_params)
   redirect_to question_path @question
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    @question.update(question_params)
    redirect_to question_path @question
  end

  private
  def question_params
   params.require(:question).permit(:title, :body)
  end
end
