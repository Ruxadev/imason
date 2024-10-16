class Project < ApplicationRecord
  belongs_to :user
  has_many :materials, dependent: :destroy
  has_many :workers, dependent: :destroy
end
