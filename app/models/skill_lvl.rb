class SkillLvl < ApplicationRecord
  belongs_to :profile
  belongs_to :skill

  validates :name, presence: true
end
