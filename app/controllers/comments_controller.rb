class CommentsController < ApplicationController
  before_action :set_commentable

  def create
    @comment = current_user.comments.new(comment_params.merge(commentable: @commentable))
    if @comment.save
      redirect_to @commentable, notice: 'Comment saved.'
    else
      redirect_to @commentable, notice: 'Comment not saved, try again.'
    end
  end

  def destroy
    comment = current_user.comments.find_by(id: params[:id], commentable: @commentable)
    comment.destroy
    redirect_to root_path
  end

  private

  def set_commentable
    @commentable = if params[:answer_id]
      Answer.find_by(id: params[:answer_id], question_id: params[:question_id])
    else
      Question.find_by(id: params[:question_id])
    end
  end

  def comment_params
    params.require(:comment).permit(:body, :user, :commentable)
  end
end
