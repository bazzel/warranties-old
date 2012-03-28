Given /^I am on a new warranty page$/ do
  visit new_warranty_path
end

Given /^I create a valid warranty$/ do
  within('#new_warranty') do
    fill_in "Name", :with => "Lamp"
    click_button "Create"
  end
end

Then /^I should be on the warranties page$/ do
  current_path.should == warranties_path
end

Then /^the warranty is created successfully$/ do
  page.should have_content("New warranty created.")
end
