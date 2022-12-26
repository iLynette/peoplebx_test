class User < ApplicationRecord

  has_many :appointments, dependent: :destroy
  has_many :bookings, through: :appointments
  has_one :profile, dependent: :destroy

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
