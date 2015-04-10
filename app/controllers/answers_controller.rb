class AnswersController < ApplicationController

  def create
    question = Question.find(params[:question_id])
    question.answers.create(answer_params.merge({user: current_user}))
    redirect_to question
  end

  def set_best
    answer = Answer.find(params[:answer])
    answer.update(best: params[:best])
    if answer.save
      redirect_to :back
    else
      redirect_to :back, notice: "Try again."
    end
  end

private
  def answer_params
    params.require(:answer).permit(:body)
  end

end
