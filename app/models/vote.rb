class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :votable, polymorphic: true

  validates :value, inclusion: { in: [1,-1],
    message: "%{value} must be 1 or -1" }
end
