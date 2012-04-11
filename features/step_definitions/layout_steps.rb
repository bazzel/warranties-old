Then /^I should see the header$/ do
  within('header') do
    page.should have_link('Warranties')
    page.should have_selector('p', :content => "Logged in as #{@current_user.email}")
  end
end
