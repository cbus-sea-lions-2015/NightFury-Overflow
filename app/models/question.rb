class Question < ActiveRecord::Base
  belongs_to :user
  has_many :responses, class_name: 'Answer'
  has_many :answers
  has_many :comments, as: :commentable
end
