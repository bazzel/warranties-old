class AddBrandIdToWarranty < ActiveRecord::Migration
  def change
    add_column :warranties, :brand_id, :integer
    add_index :warranties, :brand_id
  end
end
