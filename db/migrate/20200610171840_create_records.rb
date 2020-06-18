# frozen_string_literal: true

class CreateRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :records do |t|
      t.string :name, null: false
      t.integer :amount, null: false

      t.timestamps
    end
  end
end
