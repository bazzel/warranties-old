class AddPurchasedOnToWarranty < ActiveRecord::Migration
  def change
    add_column :warranties, :purchased_on, :date
  end
end
