class Profile < ApplicationRecord
  belongs_to :user
  has_many :skill_lvls
  has_many :reviews
  has_many :reservations

  validates :description, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :postcode, presence: true
  validates :phone, presence: true
  validates :price, presence: true

  # def self.search(search)
  # if search
  #   find(:all, :conditions => ['city ?', "%#{search}%"])
  # else
  #   find(:all)
  # end
# end

end
