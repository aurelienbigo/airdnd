class SkillLvl < ApplicationRecord
  belongs_to :profile
  belongs_to :skill

  validates :lvl, presence: true

end
