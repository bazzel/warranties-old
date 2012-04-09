# == Given
Given /^I am not signed in$/ do
  true
end

Given /^I have an account with email "([^"]*)"$/ do |email|
  @user = User.find_by_email(email) || FactoryGirl.create(:user, :email => email)
end

Given /^I am logged in as a user with email "([^"]*)" and password "([^"]*)"$/ do |email, password|
  @current_user = User.create :email => email, :password => password

  visit new_user_session_path
  fill_in "Email", :with => email
  fill_in "Password", :with => password
  click_button "Sign in"
end

# == When

# == Then
