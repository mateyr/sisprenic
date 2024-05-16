# frozen_string_literal: true

class CreateInterestRates < ActiveRecord::Migration[7.1]
  def change
    create_table :interest_rates do |t|
      t.decimal :value, null: false
      t.references :loan, null: false, foreign_key: true

      t.timestamps
    end
  end
end
