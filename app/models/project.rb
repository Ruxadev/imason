class Project < ApplicationRecord
  has_many :materials
  has_many :workers
  belongs_to :user
end
