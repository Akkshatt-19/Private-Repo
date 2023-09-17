class Review < ApplicationRecord
    belongs_to :reviewable, polymorphic: true
    belongs_to :user
    validates :feedback, presence: true, length: { maximum: 250 }
end
