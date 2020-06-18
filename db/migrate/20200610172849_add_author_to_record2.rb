# frozen_string_literal: true

class AddAuthorToRecord2 < ActiveRecord::Migration[6.0]
  def change
    add_column :records, :author_id, :integer
  end
end
