# Record model
class Record < ApplicationRecord
  include CloudinaryHelper
  belongs_to :author, class_name: 'User'
  validates :amount, numericality: { other_than: 0 }
  validates :name, presence: true
  has_many :record_groups
  has_many :groups, through: :record_groups, dependent: :destroy

  scope :most_recent, -> { order(created_at: :desc) }
end
