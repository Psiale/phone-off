class Record < ApplicationRecord
belongs_to :author, class_name: 'User'
has_many :record_groups
has_many :groups, through: :record_groups
end
