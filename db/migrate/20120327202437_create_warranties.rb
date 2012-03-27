class CreateWarranties < ActiveRecord::Migration
  def change
    create_table :warranties do |t|
      t.string :product_name

      t.timestamps
    end
  end
end
