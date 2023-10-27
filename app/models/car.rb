class Car < ApplicationRecord
    has_many :rentals, dependent: :destroy
    has_many :comments, dependent: :destroy

    validates :brand, presence: true
    validates :model, presence: true
    validates :price, presence: true
    
    scope :search, ->(term) {
        where("model LIKE ? OR brand LIKE ?", "%#{term}%", "%#{term}%")
      }
end
