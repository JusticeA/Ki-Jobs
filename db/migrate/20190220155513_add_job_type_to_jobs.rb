class AddJobTypeToJobs < ActiveRecord::Migration[5.2]
  def change
    add_column :jobs, :job_type, :string
  end
end
