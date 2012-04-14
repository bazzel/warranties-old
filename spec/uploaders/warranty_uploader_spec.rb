require 'spec_helper'

describe WarrantyUploader do
include CarrierWave::Test::Matchers

  before do
    WarrantyUploader.enable_processing = true
    @warranty = FactoryGirl.build(:warranty)
    @uploader = WarrantyUploader.new(@warranty, :warranty)
    @uploader.store!(File.open(File.join(Rails.root, 'spec', 'fixtures', 'vacuum-cleaner.jpeg')))
  end

  after do
    WarrantyUploader.enable_processing = false
    @uploader.remove!
  end

  it "should scale down a landscape image to be exactly 260 by 260 pixels" do
    @uploader.thumb.should have_dimensions(260, 260)
  end

  its(:extension_white_list) { should =~ %w(jpg jpeg gif png) }
end
