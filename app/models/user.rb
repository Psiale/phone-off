class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :email, uniqueness: true
  validates :email, presence: true
  validates :name, presence: true

  devise :database_authenticatable, :registerable,
         :rememberable, :validatable
    has_many :records, foreign_key: :author_id
    has_many :groups

end
