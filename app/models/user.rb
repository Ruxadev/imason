class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }
  validates :plan, presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :projects, dependent: :destroy
  has_many :materials, through: :projects, dependent: :destroy
  has_many :workers, through: :projects, dependent: :destroy
end
