class Car < ApplicationRecord
    after_initialize :set_default_image, if: :new_record?
    has_many :rentals, dependent: :destroy
    has_many :comments, dependent: :destroy

    validates :brand, presence: true
    validates :model, presence: true
    validates :price, presence: true
    validates :features, presence: true
    validates :autonomy, presence: true
    validates :fabrication_year, presence: true
    
    scope :search, ->(term) {
        where("model LIKE ? OR brand LIKE ?", "%#{term}%", "%#{term}%")
      }

      class Car < ApplicationRecord
        serialize :features, Array
      end

      FEATURES_OPTIONS = ['Baterias de Iones de Litio', 'Baterias de Estado Sólido', 'Carga Alámbrica', 'Carga Inalámbrica', 'Asistencia a la Conducción']
      
      
      def set_default_image
        self.imag ||= 'default.jpg'
      end
      
end
