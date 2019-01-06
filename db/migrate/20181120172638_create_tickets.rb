# frozen_string_literal: true

class CreateTickets < ActiveRecord::Migration[5.2]
  def change
    create_table :tickets do |t|
      t.string :number, unique: true
      t.string :result
      t.integer :maxlen
      t.timestamps
    end
  end
end
