class CreateMaterials < ActiveRecord::Migration[7.2]
  def change
    create_table :materials do |t|
      t.references :project, null: false, foreign_key: true
      t.string :store_name
      t.string :phone
      t.integer :rate
      t.integer :paid_value

      t.timestamps
    end
  end
end
