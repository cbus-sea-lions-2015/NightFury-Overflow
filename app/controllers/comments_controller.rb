class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      render :_show
    else
      render :new
    end
  end

  def edit
    @comment = Comment.find(params[:comment].id)
  end

  def update
    @comment = Comment.find(params[:comment].id)
    if @comment.save
      render :_show
    else
      render :edit
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
