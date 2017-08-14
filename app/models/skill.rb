class Skill < ApplicationRecord
  belongs_to :profile

  validates :lvl, presence: true
end
