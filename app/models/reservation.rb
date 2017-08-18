require 'date'

class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :profile

  validates :description, presence: true
  validates :begin_date, presence: true
  validates :end_date, presence: true

  validate :end_date_after_start_date?
  validate :start_date_after_today?

  def end_date_after_start_date?
    if end_date < begin_date
      errors.add :end_date, "must be after start date"
    end
  end

  def start_date_after_today?
    if Date.today > begin_date
      errors.add :begin_date, "must be after today"
    end
  end
end
