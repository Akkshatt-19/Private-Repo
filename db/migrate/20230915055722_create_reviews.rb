class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.references :user,null: false, foreign_key: true
      t.integer :reviewable_id, polymorphic: true
      t.string :reviewable_type
      t.string :feedback
      t.timestamps
    end
  end
end
