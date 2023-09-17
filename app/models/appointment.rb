class Appointment < ApplicationRecord
  enum status: { pending: 'pending', scheduled: 'scheduled', completed: 'completed' }
  belongs_to :user
  belongs_to :hospital
  belongs_to :test_center
  has_one_attached :image
  
  validates :user_id, presence: true
  validates :hospital_id, presence: true
  validates :test_center_id, presence: true
  validates :status, inclusion: { in: ['pending', 'scheduled', 'completed'] }
end
