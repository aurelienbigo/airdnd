class Review < ApplicationRecord
  belongs_to :profile
  belongs_to :user

  validates :description, presence: true
  validates :rating, presence: true
  validates :rating, numericality: true
  validates :rating, inclusion: { in: [1,2,3,4,5], allow_nil: false }

end
