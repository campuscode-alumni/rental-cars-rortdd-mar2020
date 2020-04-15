class AddFieldsToCarModel < ActiveRecord::Migration[6.0]
  def change
    add_column :car_models, :fuel_type, :string
    add_column :car_models, :motorization, :string
    add_column :car_models, :year, :integer
  end
end
