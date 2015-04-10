class Answer < ActiveRecord::Base
  scope :most_votes, ->() { joins(:votes).group("questions.id").order("sum(votes.value) DESC").sum("votes.value") }
  
  belongs_to :user
  belongs_to :question
  has_many :comments, as: :commentable
  has_many :votes, as: :votable
end
