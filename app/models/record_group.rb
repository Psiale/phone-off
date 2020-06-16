# frozen_string_literal: true

class RecordGroup < ApplicationRecord
  belongs_to :record
  belongs_to :group
end
