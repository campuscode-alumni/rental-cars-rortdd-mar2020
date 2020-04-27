class RemoveClientRefFromRental < ActiveRecord::Migration[6.0]
  def change
    remove_reference :rentals, :client, null: false, foreign_key: true
  end
end
