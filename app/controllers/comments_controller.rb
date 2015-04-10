class CommentsController < ApplicationController
  before_action :set_commentable

  def create
    @comment = @commentable.comments.new(comment_params.merge({user: current_user}))
    if @comment.save
      redirect_to @question
    else
      redirect_to @question, notice: 'Comment not saved, try again.'
    end
  end

  def destroy
    comment = current_user.comments.find_by(id: params[:id])
    puts "COMMENT #{comment}"
    puts "question #{@question}"
    puts "answer #{@answer}"
    puts "COMMENTable #{@commentable}"
    comment.destroy
    redirect_to @question
  end

  private

  def set_commentable
    @question = Question.find_by(id: params[:question_id])
    @answer = Answer.find_by(id: params[:answer_id]) if params[:answer_id]
    @commentable = @answer || @question
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
