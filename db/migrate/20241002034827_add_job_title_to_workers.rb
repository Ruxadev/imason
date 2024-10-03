class AddJobTitleToWorkers < ActiveRecord::Migration[7.2]
  def change
    add_column :workers, :job_title, :string
  end
end
