class VotesController < ApplicationController
  before_action :set_votable

  def create
    @vote = Vote.new(vote_params)
    if @vote.save
      render 'questions/index'
    else
      render 'questions/index'
    end
  end

  def create
    @vote = @votable.votes.new(vote_params.merge({user: current_user}))
    if @vote.save
      redirect_to @question
    else
     redirect_to @question, notice: 'Vote not saved, try again.'
    end         
  end       

  def destroy
    vote = current_user.vote.find_by(id: params[:id])
    vote.destroy
    redirect_to root_path
  end

  private
  def set_votable
    @question = Question.find_by(id: params[:question_id])
    @answer = Answer.find_by(id: params[:answer_id]) if params[:answer_id]
    @votable = @answer || @question
  end

  def vote_params
    params.require(:vote).permit(:direction)
  end
end
