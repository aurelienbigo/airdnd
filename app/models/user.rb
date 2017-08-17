class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :profile
  has_many :reservations
  has_many :reviews

  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :email, uniqueness: true, presence: true

  has_attachment :photo

end
