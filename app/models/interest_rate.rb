# frozen_string_literal: true

class InterestRate < ApplicationRecord
  FIXED = 1
  VARIABLE = 2

  validates :value, presence: true
  belongs_to :loan
end
