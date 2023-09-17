class CreateAppointments < ActiveRecord::Migration[7.0]
  def change
    create_table :appointments do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :user_role
      t.string :description
      t.references :hospital, null: false, foreign_key: true
      t.references :test_center, null: false, foreign_key: true
      t.integer :status

      t.timestamps
    end
  end
end
