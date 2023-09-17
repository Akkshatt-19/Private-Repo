class CreateTestCenters < ActiveRecord::Migration[7.0]
  def change
    create_table :test_centers do |t|
      t.string :name
      t.references :hospital, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
