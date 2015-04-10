class Answer < ActiveRecord::Base
  # scope :best_answer, ->() { joins(:votes).group("answers.id").sum("votes.value") }

  belongs_to :user
  belongs_to :question
  has_many :comments, as: :commentable
  has_many :votes, as: :votable
end
