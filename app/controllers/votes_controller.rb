class VotesController < ApplicationController

  def create
    @vote = Vote.new(vote_params)
    if @vote.save
      render 'questions/index'
    else
      render 'questions/index'
    end
  end

  def destroy
    vote = Vote.find(params[:vote].id)
    vote.destroy
    redirect_to root_path
  end

  private

  def vote_params
    params.require(:vote).permit(:user, :votable)
  end
end
