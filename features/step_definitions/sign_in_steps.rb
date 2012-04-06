# Then /^I should see the sign in page$/ do
#   step %{I am on the sign in page}
#   step %{I should see "e-fueling" in the header}
#   step %{I should see "Sign In" button in the content}
#   step %{I should see "Create Account" in the content}
# end
#
When /^I submit an empty sign in form$/ do
  visit new_user_session_path
  click_button I18n.t('helpers.submit.user.create')
end


Given /^I submit the sign in form with invalid credentials$/ do
  visit new_user_session_path
  within('form') do
    fill_in 'Email', :with => 'john.doe@example.com'
    fill_in 'Password', :with => 'Secret.1'
  end
  click_button I18n.t('helpers.submit.user.create')
end

Then /^I see that I have entered invalid credentials$/ do
  within_flash do
    page.should have_content('Invalid email or password.')
  end
end

# Then /^I should see a page for entering a new car$/ do
#   step %{I should see "Add Car" in the header}
# end
#
When /^I forgot my password$/ do
  visit new_user_session_path
  click_link "Forgot your password?"
end

Then /^I can ask for an email with instructions about how to reset my password$/ do
  within('form') do
    fill_in 'Email', :with => 'john.doe@example.com'
    click_button I18n.t('helpers.submit.password.create')
  end
  step %{"john.doe@example.com" should receive an email}
end

When /^I ask for reset password instructions without providing an email address$/ do
  click_button I18n.t('helpers.submit.password.create')
end

Then /^I see that I should have entered an email address first$/ do
  within('form') do
    input_error(:text => "can't be blank")
  end
end

When /^I ask for reset password instructions for an invalid email address$/ do
  within('form') do
    fill_in 'Email', :with => 'unknown@example.com'
    click_button I18n.t('helpers.submit.password.create')
  end
end

Then /^I see that I should have entered a valid email address first$/ do
  within('form') do
    input_error(:text => "not found")
  end
end
