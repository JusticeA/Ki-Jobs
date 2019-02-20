class AddRecruiterIdToJobs < ActiveRecord::Migration[5.2]
  def change
    add_column :jobs, :recruiter_id, :integer
  end
end
