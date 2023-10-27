class Rental < ApplicationRecord
  belongs_to :car
  belongs_to :user
  validates :start_date, presence: true
  validates :end_date, presence: true
  validate :end_date_after_start_date

  private

  def end_date_after_start_date
    return if end_date.blank? || start_date.blank?

    if end_date < start_date
      errors.add(:end_date, "debe ser después de la fecha de inicio")
    end
  end

end
