require 'spec_helper'

describe WarrantyUploader do
include CarrierWave::Test::Matchers

  before do
    PhotoUploader.enable_processing = true
    @warranty = FactoryGirl.build(:warranty)
    @uploader = PhotoUploader.new(@warranty, :photo)
    @uploader.store!(File.open(File.join(Rails.root, 'spec', 'fixtures', '1000.gif')))
  end

  after do
    PhotoUploader.enable_processing = false
    @uploader.remove!
  end

  it "should scale down a landscape image to be exactly 260 by 260 pixels" do
    @uploader.thumb.should have_dimensions(260, 260)
  end

  it "should scale down a image to be exactly 600 by 600 pixels" do
    @uploader.large.should have_dimensions(600, 600)
  end

  its(:extension_white_list) { should =~ %w(jpg jpeg gif png) }
end
