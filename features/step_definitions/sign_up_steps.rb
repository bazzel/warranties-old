When /^I enter no data for a new account$/ do
  click_button I18n.t('helpers.submit.registration.create')
end

When /^I choose to create a new account$/ do
  visit new_user_registration_path
  within('form') do
    page.should have_content("Email")
    page.should have_content("Password")
    page.should have_content("Password confirmation")
  end
end

When /^I enter valid data for a new account$/ do
  within('form') do
    fill_in 'Email', :with => 'john.doe@example.com'
    fill_in 'Password', :with => 'Secret.1'
    fill_in 'Password confirmation', :with => 'Secret.1'
    click_button I18n.t('helpers.submit.registration.create')
  end
end

When /^I didn't confirm my password$/ do
  within('form') do
    fill_in 'Email', :with => 'john.doe@example.com'
    fill_in 'Password', :with => 'Secret.1'
    click_button I18n.t('helpers.submit.registration.create')
  end
end

Then /^I see that the password I entered doesn't match confirmation$/ do
  within('form') do
    input_error(:text => "doesn't match confirmation")
  end
end

Then /^I see that I should have entered credentials first$/ do
  within('form') do
    input_error(:text => "can't be blank", :count => 2)
  end
end
