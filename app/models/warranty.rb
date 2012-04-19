class Warranty < ActiveRecord::Base
  # CarrierWave
  mount_uploader :warranty, WarrantyUploader
  mount_uploader :photo, PhotoUploader

  # attributes
  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
  delegate :name, :to => :brand, :prefix => true, :allow_nil => true

  # relations
  belongs_to :brand
  belongs_to :user

  # validations
  validates :name, :warranty, :expires_on, :presence => true

  # callbacks
  before_save :set_brand_from_name # When brand_name is assigned to object, handle the brand attribute automatically.
  after_update :crop_photo

  def brand_name=(value)
    # Changes in brand_name are not tracked by the ActiveRecord::Dirty module,
    # so we do it ourselves.
    @brand_name_changed = true
    @brand_name = value
  end

  private
    def crop_photo
      photo.recreate_versions! if crop_x.present?
    end

    def set_brand_from_name
      return unless @brand_name_changed

      self.brand = @brand_name.present? ? user.brands.find_or_create_by_name(@brand_name) : nil
    end
end
