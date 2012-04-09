require 'spec_helper'

describe WarrantiesController do
  login_user

  before(:each) do
    @warranty = double
    Warranty.stub(:new).and_return(@warranty)
  end

  describe "GET index" do
    before(:each) do
      @warranties = double
      Warranty.stub(:all).and_return(@warranties)
    end

    def do_get
      get :index
    end

    it "assigns @warranties" do
      Warranty.should_receive(:all).and_return(@warranties)
      do_get
      assigns(:warranties).should == @warranties
    end

    it "renders 'index'" do
      do_get
      response.should render_template('index')
    end
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

  describe "GET show" do
    before(:each) do
      Warranty.stub(:find).with('42').and_return(@warranty)
    end

    def do_get
      get :show, :id => '42'
    end

    it "assigns the requested warranty as @warranty" do
      Warranty.should_receive(:find).with('42').and_return(@warranty)
      do_get
      assigns(:warranty).should == @warranty
    end

    it "renders 'show'" do
      do_get
      response.should render_template('show')
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

    describe "success" do
      it "redirects to warranties_path" do
        do_post
        response.should redirect_to(warranty_path(@warranty))
      end

      it "flashes notification" do
        do_post
        flash[:notice].should == "New warranty created."
      end
    end

    describe "failure" do
      before(:each) do
        @warranty.stub(:save).and_return(false)
      end

      it "render new" do
        do_post
        response.should render_template(:new)
      end
    end
  end

end
