class Review < ApplicationRecord
  belongs_to :profile
  belongs_to :user

  validates :description, presence: true
  validates :rating, presence: true
  validates :rating, numericality: true
  validates :rating, :inclusion => { :in =>0..5 }

end
