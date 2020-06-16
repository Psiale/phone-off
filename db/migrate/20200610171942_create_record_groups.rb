# frozen_string_literal: true

class CreateRecordGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :record_groups do |t|
      t.references :record, null: false, foreign_key: true
      t.references :group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
