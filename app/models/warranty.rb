class Warranty < ActiveRecord::Base
  mount_uploader :warranty, WarrantyUploader
  mount_uploader :photo, PhotoUploader

  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
  after_update :crop_photo

  validates :name, :warranty, :expires_on, :presence => true


  private
    def crop_photo
      photo.recreate_versions! if crop_x.present?
    end
end
