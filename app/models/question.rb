class Question < ActiveRecord::Base
  scope :most_votes, ->() { joins(:votes).group("questions.id").order("sum(votes.value) DESC").sum("votes.value") }
  # scope :most_votes, ->() { joins(:votes).group("questions.id").order("sum(votes.up)").map {|q| q.votes.sum(:up) }

  scope :vote_order, ->() { joins(:votes).group("questions.id").order("sum(votes.direction) DESC") }
  scope :comment_order, ->() { joins(:comments).group("questions.id").order("count(comments) DESC") }

  belongs_to :user
  has_many :responses, class_name: 'Answer'
  has_many :answers
  has_many :comments, as: :commentable
  has_many :votes, as: :votable

end
