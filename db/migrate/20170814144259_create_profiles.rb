class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.integer :price
      t.string :url
      t.text :description
      t.string :address
      t.string :city
      t.integer :postcode
      t.float :lng
      t.float :lat
      t.string :phone
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
