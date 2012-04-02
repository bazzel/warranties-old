class AddWarrantyImageToWarranty < ActiveRecord::Migration
  def change
    add_column :warranties, :warranty, :string

  end
end
