class AddPictureToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :picture, :binary
  end
end
