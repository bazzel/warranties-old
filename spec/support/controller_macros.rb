module ControllerMacros
  def login_user
    before(:each) do
      sign_out :user
      sign_in FactoryGirl.create(:user)
    end
  end
end
