class Material < ApplicationRecord
  belongs_to :project
  validates :store_name, :building_material, :phone, :quantity, :rate, :paid_value, presence: true
end
