class Profile < ApplicationRecord
  belongs_to :user
  has_many :skill_lvl
  has_many :review
  has_many :reservation

  validates :description, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :postcode, presence: true
  validates :phone, presence: true
  validates :price, presence: true

end
