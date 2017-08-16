class AddColumnsToReservation < ActiveRecord::Migration[5.1]
  def change
    add_column :reservations, :status, :string
    add_column :reservations, :price, :integer
  end
end
