class RemoveUserRoleFromAppointments < ActiveRecord::Migration[7.0]
  def change
    remove_column :appointments, :user_role
  end
end
