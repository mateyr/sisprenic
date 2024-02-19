# frozen_string_literal: true

class Client < ApplicationRecord
  validates :first_name, :last_name, :identification, :phone_number, presence: true

  validates :first_name, :middle_name, :last_name, :second_last_name, length: { maximum: 25 },
                                                                      format: { with: /\A[a-zA-ZñÑáéíóúÁÉÍÓÚ]+\z/,
                                                                                message: "solo puede contener letras" },
                                                                      allow_blank: true

  validates :identification, uniqueness: true, length: { maximum: 16 }

  validates :identification, format: { with: /\A\d{3}-\d{6}-\d{4}[a-zA-Z]\z/,
                                       message: "el formato no es válido" },
                             if: -> { identification.present? }

  validates :phone_number, uniqueness: true, length: { maximum: 8 }, if: -> { phone_number =~ /\A\d+\z/ }

  validates :phone_number, format: { with: /\A\d{8}\z/,
                                     message: "el formato no es válido" },
                           if: -> { phone_number.present? }
  def short_name
    "#{first_name} #{last_name}".squish
  end
end
