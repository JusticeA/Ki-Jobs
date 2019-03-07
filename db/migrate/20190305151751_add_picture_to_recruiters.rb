class AddPictureToRecruiters < ActiveRecord::Migration[5.2]
  def change
    add_column :recruiters, :picture, :binary
  end
end
