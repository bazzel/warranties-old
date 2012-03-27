require 'spec_helper'

describe WarrantiesController do
  before(:each) do
    @warranty = double
    Warranty.stub(:new).and_return(@warranty)
  end

  describe "GET index" do


  end

  describe "GET new" do
    def do_get
      get :new
    end

    it "instantiates new warranty" do
      Warranty.should_receive(:new)
      do_get
    end

    it "assigns @warranty" do
      do_get
      assigns(:warranty).should == @warranty
    end
  end

  describe "POST create" do
    before(:each) do
      @warranty.stub(:save).and_return(true)
    end

    def do_post
      post :create, :warranty => {:these => 'params'}
    end

    it "assigns a newly created warranty to @warranty" do
      Warranty.should_receive(:new).with({'these' => 'params'}).and_return(@warranty)
      do_post
      assigns(:warranty).should == @warranty
    end

    it "saves the warranty" do
      @warranty.should_receive(:save).and_return(true)
      do_post
    end

    it "redirects to warranties_path" do
      do_post
      response.should redirect_to(warranties_path)
    end
  end

end
