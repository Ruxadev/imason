class AddObservationToMaterials < ActiveRecord::Migration[7.2]
  def change
    add_column :materials, :observation, :string
  end
end
