class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :profile

  validates :description, presence: true
  validates :begin_date, presence: true
  validates :end_date, presence: true

end
