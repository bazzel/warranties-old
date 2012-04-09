class AddUserIdToWarranties < ActiveRecord::Migration
  def change
    add_column :warranties, :user_id, :integer
  end
end
