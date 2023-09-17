class RemoveDataTimeFromAppointment < ActiveRecord::Migration[7.0]
  def change
    remove_column :appointments, :appointment_datetime
  end
end
