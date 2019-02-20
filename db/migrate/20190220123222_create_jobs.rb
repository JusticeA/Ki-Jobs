class CreateJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :jobs do |t|
      t.string :title
      t.text :details
      t.string :location
      t.text :requirement
      t.timestamp :close_date
      t.text :how_to_apply

      t.timestamps
    end
  end
end
