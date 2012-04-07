class Warranty < ActiveRecord::Base
  mount_uploader :warranty, WarrantyUploader

  validates :name, :warranty, :presence => true
end
