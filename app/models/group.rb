class Group < ApplicationRecord
    belongs_to :user
    has_many :record_groups
    validates :name, presence: true
    validates :icon, presence: true
    has_many :records, through: :record_groups
end
