class Profile < ApplicationRecord
  geocoded_by :full_address, :latitude  => :lat, :longitude => :lng
  after_validation :geocode, if: :address_changed?

  belongs_to :user
  has_many :skill_lvls
  has_many :skills , through: :skill_lvls
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

  def full_address
    [address, postcode, city].compact.join(', ')
  end

end
