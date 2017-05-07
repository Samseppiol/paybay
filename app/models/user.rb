class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :first_name, :last_name, :date_of_birth, presence: true
  validates_length_of :first_name, :last_name, { :minimum =>2, :maximum => 25}
end
