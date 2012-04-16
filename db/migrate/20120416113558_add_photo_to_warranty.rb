class AddPhotoToWarranty < ActiveRecord::Migration
  def change
    add_column :warranties, :photo, :string

  end
end
