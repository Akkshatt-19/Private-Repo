class TestCenter < ApplicationRecord
  belongs_to :hospital
  has_many :appointments
  has_one_attached :image
  
  has_many :reviews, as: :reviewable
  
  validates :name, presence: true, length: { maximum: 100 }
  validates :hospital_id, presence: true
  validates :location, presence: true, length: { maximum: 250 }
  
end
