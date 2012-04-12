Then /^I should see the header$/ do
  within('header') do
    page.should have_link('Warranties')
    page.should have_content("Logged in as #{@current_user.email}")
  end
end

Then /^I should see the header in Dutch$/ do
  I18n.locale.to_s.should == 'nl'
  within('header') do
    page.should have_content("Ingelogd als #{@current_user.email}")
  end
end

Then /^the application is presented in Dutch$/ do
  step %{I should see the header in Dutch}
end
