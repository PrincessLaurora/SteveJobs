class CreateListings < ActiveRecord::Migration[5.2]
  def change
    create_table :listings do |t|
      t.string :title
      t.string :location
      t.string :description
      t.string :employment_type
      t.string :requirements
      t.integer :retribution
      t.integer :user_id
      t.integer :category_id
      

      t.timestamps
    end
  end
end
