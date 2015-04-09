class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      render :_show
    else
      render :new
    end
  end

  def destroy
    comment = Comment.find(params[:comment].id)
    comment.destroy
    redirect_to root_path
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :user, :commentable)
  end
end
