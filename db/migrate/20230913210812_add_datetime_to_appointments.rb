class AddDatetimeToAppointments < ActiveRecord::Migration[7.0]
  def change
    add_column :appointments, :appointment_datetime, :datetime
  end
end
