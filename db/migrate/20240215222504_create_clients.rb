# frozen_string_literal: true

class CreateClients < ActiveRecord::Migration[7.1]
  def change
    create_table :clients do |t|
      t.string :first_name, null: false, limit: 25
      t.string :middle_name, default: "", limit: 25
      t.string :last_name, null: false, limit: 25
      t.string :second_last_name, default: "", limit: 25
      t.string :identification, null: false, index: { unique: true }, limit: 16
      t.string :phone_number, null: false, index: { unique: true }, limit: 8

      t.timestamps
    end
  end
end
