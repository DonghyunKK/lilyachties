class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :yachts, dependent: :destroy
  has_many :reviews
  has_many :bookings
  # validates :email, format: { with: /\b[\w\.-]+@[\w\.-]+\.\w{2,4}\b/ }
  # validates :password, length: { in: 6..20 }
end
