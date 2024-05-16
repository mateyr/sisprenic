# frozen_string_literal: true

class CreateLoans < ActiveRecord::Migration[7.1]
  def change
    create_table :loans do |t|
      t.decimal :capital, null: false
      t.integer :term, null: false
      t.date :start_date, null: false
      t.date :end_date, null: false
      t.integer :payment_frequency, null: false
      t.integer :status, null: false, default: 1
      t.integer :interest_type
      t.text :additional_note, default: ""
      t.references :client, null: false, foreign_key: true

      t.timestamps
    end
  end
end
