class AddBuildingMaterialToMaterials < ActiveRecord::Migration[7.2]
  def change
    add_column :materials, :building_material, :string
  end
end
