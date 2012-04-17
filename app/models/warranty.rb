class Warranty < ActiveRecord::Base
  mount_uploader :warranty, WarrantyUploader
  mount_uploader :photo, PhotoUploader

  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
  after_update :crop_photo

  validates :name, :warranty, :expires_on, :presence => true

  belongs_to :brand
  belongs_to :user

  delegate :name, :to => :brand, :prefix => true, :allow_nil => true

  def brand_name=(value)
    if value.present?
      brand = user.brands.find_or_initialize_by_name(value)
      brand.user = user
    else
      brand = nil
    end

    self.brand = brand
  end


  private
    def crop_photo
      photo.recreate_versions! if crop_x.present?
    end
end
