# frozen_string_literal: true

class Loan < ApplicationRecord
  validates :capital, :term, :start_date, :end_date, :payment_frequency, :interest_type, presence: true
  validates :capital, numericality: { greater_than: 0 }
  validates :term, numericality: true
  validates :payment_frequency, numericality: true
  validates :interest_type, numericality: { only_integer: true,
                                            greater_than_or_equal_to: 1,
                                            less_than_or_equal_to: 2 }

  has_many :interest_rates, dependent: :destroy
  accepts_nested_attributes_for :interest_rates
  belongs_to :client
end
