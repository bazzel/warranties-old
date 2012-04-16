require 'spec_helper'

describe WarrantiesController do
  before(:each) do
    @warranty = FactoryGirl.create(:warranty, :id => 42)
  end

  it "routes to crop action" do
    { :get => crop_warranty_path(@warranty) }.
      should route_to(:controller => 'warranties', :action => 'crop', :id => '42')
  end
end
