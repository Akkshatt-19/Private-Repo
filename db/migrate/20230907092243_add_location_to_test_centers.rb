class AddLocationToTestCenters < ActiveRecord::Migration[7.0]
  def change
    add_column :test_centers, :location, :string
  end
end