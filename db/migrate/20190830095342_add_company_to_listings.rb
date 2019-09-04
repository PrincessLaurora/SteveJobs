class AddCompanyToListings < ActiveRecord::Migration[5.2]
  def change
    add_column :listings, :company, :string
  end
end
