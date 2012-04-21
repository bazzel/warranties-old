Given /^I have the following warranty:$/ do |table|
  step %{a user with email "#{@current_user.email}" has the following warranties:}, table
  @warranty = @user.warranties.first
end

Given /^I have the following warranties:$/ do |table|
  step %{a user with email "#{@current_user.email}" has the following warranties:}, table
end

Given /^a user with email "([^"]*)" has the following warranties:$/ do |email, table|
  step %{I have an account with email "#{email}"}

  table.map_headers! {|header| header.downcase.to_sym }
  table.map_column!('warranty') {|warranty| File.open(File.join(Rails.root, 'spec', 'fixtures', warranty)) }
  table.map_column!('photo', false) {|photo| File.open(File.join(Rails.root, 'spec', 'fixtures', photo)) }

  table.hashes.each do |hash|
    hash[:user] = @current_user
    @user.warranties << FactoryGirl.create(:warranty, hash)
  end
end

When /^I click on the image of the first warranty$/ do
  @warranty = @current_user.warranties.first
  within("#warranty_#{@warranty.id}") do
    filename = @warranty.photo_url(:thumb)
    basename = File.basename(filename, File.extname(filename))
    alt_text = basename.capitalize
    click_link alt_text
  end
end

Given /^I click on the Edit button of the first warranty$/ do
  @warranty = @current_user.warranties.first
  within("#warranty_#{@warranty.id}") do
    step %{I click on the Edit button}
  end
end

Given /^I click on the Edit button$/ do
  click_link "Edit"
end

When /^I delete the first warranty$/ do
  @warranty = @current_user.warranties.first
  within("#warranty_#{@warranty.id}") do
    click_link "Destroy"
  end
end

Given /^I click on the image for the warranty$/ do
  click_link "warranty_warranty_#{@warranty.id}"
end

Then /^I have (\d+) warranties left$/ do |count|
  @current_user.warranties.count.should == count.to_i
end

# Form steps
#
Given /^I enter valid data on the warranty's form$/ do
  within('form') do
    fill_in "Name", :with => "Lamp"
    fill_in "Expires on", :with => 2.years.from_now
    attach_file "Warranty", File.join(Rails.root, 'spec', 'fixtures', 'warranty.gif')
  end
end

Given /^I create a valid warranty$/ do
  step %{I enter valid data on the warranty's form}
  click_button "Create"
  @warranty = @current_user.warranties.last
end

Given /^I update the warranty with valid data$/ do
  visit edit_warranty_path(@warranty)
  step %{I enter valid data on the warranty's form}
  click_button "Update"
end

Given /^I create an invalid warranty$/ do
  within('form') do
    click_button "Create"
  end
end

Given /^I update the warranty with invalid data$/ do
  visit edit_warranty_path(@warranty)
  within('form') do
    fill_in "Name", :with => ""
    fill_in "Expires on", :with => nil
    attach_file "Warranty", File.join(Rails.root, 'spec', 'fixtures', 'invalid.xyz')
    click_button "Update"
  end
end

Given /^I upload a photo of the warranty's product$/ do
  within('form') do
    attach_file "Photo", File.join(Rails.root, 'spec', 'fixtures', 'photo.gif')
  end
end

Given /^I upload an invalid file$/ do
  within('form') do
    attach_file "Warranty", File.join(Rails.root, 'spec', 'fixtures', 'invalid.xyz')
  end
  step %{I submit the form}
end

Given /^I submit the form$/ do
  # click_button "Create"
  find('input[name="commit"]').click
  @warranty ||= @current_user.warranties.last
end

Given /^I type "([^"]*)" into the "([^"]*)" input$/ do |value, name|
  fill_in name, :with => value
end
#
# End form steps

Then /^I should see a listing of my warranties$/ do
  @current_user.warranties.each do |warranty|
    page.should have_selector("li#warranty_#{warranty.id}")
    page.should have_content warranty.name
    page.should have_selector("img[src='#{warranty.photo_url(:thumb)}']")
  end
end

Then /^I should not see a listing of warranties that belong to "([^"]*)"$/ do |email|
  user = User.find_by_email(email)
  user.warranties.each do |warranty|
    page.should_not have_selector("li#warranty_#{warranty.id}")
  end
end

Then /^I should see the warranty's detail page$/ do
  @warranty.reload
  current_path.should == warranty_path(@warranty)
  page.should have_content(@warranty.name)
  # page.should have_selector("img[src='#{@warranty.warranty_url(:thumb)}']")
  page.should have_link("View Warranty", :href => @warranty.warranty_url(:large))

  if @warranty.photo?
    page.should have_selector("img[src='#{@warranty.photo_url(:thumb)}']")
  else
    page.should_not have_selector("img[src='#{@warranty.photo_url(:thumb)}']")
  end
end

Then /^I should see "([^"]*)" on the warranty's detail page$/ do |content|
  current_path.should == warranty_path(@warranty)
  page.should have_content(content)
end

Then /^I should see a larger version popping up$/ do
  page.should have_css('.fancybox-wrap')
end

When /^I cancel the (?:creation|update)$/ do
  within('#action-bar') do
    click_link 'Back'
  end
end

When /^I crop the photo of the warranty's product$/ do
  click_button "Crop"
end

Then /^I should see that the warranty is invalid$/ do
  within('form') do
    page.should have_content("can't be blank")
  end
end

Then /^I should see that the file type is invalid$/ do
  within('form') do
    page.should have_content('You are not allowed to upload "xyz" files, allowed types: ["jpg", "jpeg", "gif", "png"]')
  end
end

Then /^I cannot remove the photo$/ do
  within('form') do
    page.should have_no_selector("input[id='warranty_remove_photo']")
  end
end

Then /^I can remove the photo$/ do
  within('form') do
    page.should have_selector("input[id='warranty_remove_photo']")
  end
end

Then /^all my warranties were deleted as well$/ do
  Warranty.count.should == 0
end
