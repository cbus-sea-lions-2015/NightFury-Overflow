class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :votable, polymorphic: true

  validates :direction, inclusion: { in: [1,-1],
    message: "%{direction} must be 1 or -1" }
end
