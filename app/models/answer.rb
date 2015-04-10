class Answer < ActiveRecord::Base
  # scope :best_order ->() { joins(:votes).group('answers.id,best').order('best,sum(votes.direction)') }
  
  belongs_to :user
  belongs_to :question
  has_many :comments, as: :commentable
  has_many :votes, as: :votable
end
