class AddExpiresOnToWarranty < ActiveRecord::Migration
  def change
    add_column :warranties, :expires_on, :date

  end
end
