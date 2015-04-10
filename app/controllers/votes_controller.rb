class VotesController < ApplicationController
  before_action :set_votable

  def create
    @vote = @votable.votes.new({user: current_user, direction: params[:direction]})
    if @vote.save
      redirect_to :back
    else
     redirect_to :back, notice: 'Vote not saved, try again.'
    end         
  end       

  def destroy
    vote = current_user.votes.find_by(id: params[:id])
    vote.destroy
    redirect_to root_path
  end

  private

  def set_votable
    @answer = Answer.find_by(id: params[:answer_id]) if params[:answer_id]
    @question = Question.find_by(id: params[:question_id])
    @votable = @answer || @question
  end
end
