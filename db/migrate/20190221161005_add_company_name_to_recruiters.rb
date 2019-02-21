class AddCompanyNameToRecruiters < ActiveRecord::Migration[5.2]
  def change
    add_column :recruiters, :company_name, :string
    add_column :recruiters, :company_profile, :text
    add_column :recruiters, :address, :text
  end
end
