class AddNotesToWarranty < ActiveRecord::Migration
  def change
    add_column :warranties, :notes, :text

  end
end
