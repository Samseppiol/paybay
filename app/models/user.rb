class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :listings, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :first_name, :last_name, :date_of_birth, :username, presence: true
  validates_length_of :first_name, :last_name, :username, { :minimum =>2, :maximum => 25}
  validates :username, uniqueness: true
end
