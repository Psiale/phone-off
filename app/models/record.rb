class Record < ApplicationRecord
    include CloudinaryHelper
    belongs_to :author, class_name: 'User'
    validates :amount, presence: true
    validates :name, presence: true
    has_many :record_groups
    has_many :groups, through: :record_groups

scope :most_recent, -> { order(created_at: :desc) }
end
