class Group < ApplicationRecord
    belongs_to :user
    has_many :record_groups
    has_many :records, through: :record_groups
end
