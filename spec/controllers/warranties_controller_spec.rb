require 'spec_helper'

describe WarrantiesController do
  login_user

  before(:each) do
    @current_user = mock_model(User, :locale => 'en')
    controller.stub(:current_user).and_return(@current_user)

    @warranties = double
    @current_user.stub(:warranties).and_return(@warranties)

    @warranty = double
    Warranty.stub(:new).and_return(@warranty)
  end

  describe "GET index" do
    before(:each) do
      @warranties.stub(:all).and_return(@warranties)
    end

    def do_get
      get :index
    end

    it "assigns @warranties" do
      @current_user.warranties.should_receive(:all).and_return(@warranties)
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

  describe "GET edit" do
    before(:each) do
      @current_user.warranties.stub(:find).with('42').and_return(@warranty)
    end

    def do_get
      get :edit, :id => '42'
    end

    it "assigns the requested warranty as @warranty" do
      @current_user.warranties.should_receive(:find).with('42').and_return(@warranty)
      do_get
      assigns(:warranty).should == @warranty
    end

    it "renders 'edit'" do
      do_get
      response.should render_template('edit')
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
      @current_user.warranties.stub(:build).with({'these' => 'params'}).and_return(@warranty)
      @warranty.stub(:save).and_return(true)
    end

    def do_post
      post :create, :warranty => {:these => 'params'}
    end

    it "assigns a newly created warranty to @warranty" do
      @current_user.warranties.should_receive(:build).with({'these' => 'params'}).and_return(@warranty)
      do_post
      assigns(:warranty).should == @warranty
    end

    it "saves the warranty" do
      @warranty.should_receive(:save).and_return(true)
      do_post
    end

    describe "success" do
      it "redirects to warranty_path" do
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

  describe "PUT update" do
    before(:each) do
      @current_user.warranties.stub(:find).with('42').and_return(@warranty)
      @warranty.stub(:update_attributes).with({ 'these' => 'params' }).and_return(true)
    end

    def do_put
      put :update, :id => '42', :warranty => {'these' => 'params'}
    end

    it "assigns the requested warranty as @warranty" do
      @current_user.warranties.should_receive(:find).with('42').and_return(@warranty)
      do_put
      assigns(:warranty).should == @warranty
    end

    it "updates the warranty" do
      @warranty.should_receive(:update_attributes).with({ 'these' => 'params' }).and_return(true)
      do_put
    end

    describe "success" do
      it "redirects to warranty_path" do
        do_put
        response.should redirect_to(warranty_path(@warranty))
      end

      it "flashes notification" do
        do_put
        flash[:notice].should == I18n.t('flash.warranty_updated')
      end
    end

    describe "failure" do
      before(:each) do
        @warranty.stub(:update_attributes).and_return(false)
      end

      it "render new" do
        do_put
        response.should render_template(:edit)
      end
    end
  end

  describe "DELETE destroy" do

    before(:each) do
      @current_user.warranties.stub(:find).with("42").and_return(@warranty)
      @warranty.stub(:destroy).and_return(true)
    end

    def do_delete
      delete :destroy, :id => "42"
    end

    it "destroys the requested warranty" do
      @current_user.warranties.should_receive(:find).with("42").and_return(@warranty)
      @warranty.should_receive(:destroy)
      do_delete
    end

    it "redirects to warranties_path" do
      do_delete
      response.should redirect_to(warranties_path)
    end

    it "flashes notification" do
      do_delete
      flash[:notice].should == "Warranty deleted."
    end
  end

end
