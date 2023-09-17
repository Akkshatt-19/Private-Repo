class AddTestCenterReferenceToHospital < ActiveRecord::Migration[7.0]
  def change
    add_reference :hospitals, :test_centers, foreign_key: true
  end
end
