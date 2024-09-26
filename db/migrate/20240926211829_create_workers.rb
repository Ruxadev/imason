class CreateWorkers < ActiveRecord::Migration[7.2]
  def change
    create_table :workers do |t|
      t.references :project, null: false, foreign_key: true
      t.string :name
      t.string :phone
      t.integer :rate
      t.integer :paid_value
      t.integer :worked_hours

      t.timestamps
    end
  end
end
