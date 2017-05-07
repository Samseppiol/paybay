class User < ApplicationRecord
  has_many :listings, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :first_name, :last_name, :date_of_birth, presence: true
  validates_length_of :first_name, :last_name, { :minimum =>2, :maximum => 25}
end
