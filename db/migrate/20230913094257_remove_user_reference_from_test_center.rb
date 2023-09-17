class RemoveUserReferenceFromTestCenter < ActiveRecord::Migration[7.0]
  def change
    remove_reference :test_centers, :user, foreign_key: true, index: false
  end
end
