class Warranty < ActiveRecord::Base
  mount_uploader :warranty, WarrantyUploader

  validates :name, :warranty, :expires_on, :presence => true
end
