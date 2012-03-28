class RenameProductNameForWarrantyToName < ActiveRecord::Migration
  def up
    rename_column "warranties", "product_name", "name"
  end

  def down
    rename_column "warranties", "name", "product_name"
  end
end
