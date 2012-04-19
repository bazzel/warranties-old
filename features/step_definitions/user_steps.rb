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
When /^I edit my profile$/ do
  click_link @current_user.email
end

When /^I change my language to "([^"]*)"$/ do |language|
  step %{I edit my profile}
  select("Nederlands", :from => "Language")
  fill_in("Current password", :with => @current_user.password)
  click_button "Update User"
end

When /^I delete my account$/ do
  step %{I edit my profile}
  click_link "Cancel my account"
end

# == Then
Then /^I should see my profile page$/ do
  current_path.should == edit_user_registration_path
  step %{I should see the header}
end
