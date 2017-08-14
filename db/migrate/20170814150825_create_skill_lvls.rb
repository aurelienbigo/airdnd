class CreateSkillLvls < ActiveRecord::Migration[5.1]
  def change
    create_table :skill_lvls do |t|
      t.integer :lvl
      t.references :profile, foreign_key: true
      t.references :skill, foreign_key: true

      t.timestamps
    end
  end
end
