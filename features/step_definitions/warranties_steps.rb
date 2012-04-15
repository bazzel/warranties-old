Given /^I have the following warranties:$/ do |table|
  step %{a user with email "#{@current_user.email}" has the following warranties:}, table
end

Given /^a user with email "([^"]*)" has the following warranties:$/ do |email, table|
  step %{I have an account with email "#{email}"}

  table.map_headers! {|header| header.downcase.to_sym }
  table.map_column!('warranty') {|warranty| File.open(File.join(Rails.root, 'spec', 'fixtures', warranty)) }

  table.hashes.each do |hash|
    @user.warranties << FactoryGirl.create(:warranty, hash)
  end
end

When /^I click on the image of the first warranty$/ do
  @warranty = Warranty.first
  within("#warranty_#{@warranty.id}") do
    filename = @warranty.warranty_url(:thumb)
    basename = File.basename(filename, File.extname(filename))
    alt_text = basename.capitalize
    click_link alt_text
  end
end

When /^I delete the first warranty$/ do
  @warranty = Warranty.first
  within("#warranty_#{@warranty.id}") do
    click_link "Destroy"
  end
end

Then /^I have (\d+) warranties left$/ do |count|
  @current_user.warranties.count.should == count.to_i
end

Given /^I create a valid warranty$/ do
  within('form') do
    fill_in "Name", :with => "Lamp"
    fill_in "Expires on", :with => 2.years.from_now
    attach_file "Warranty", File.join(Rails.root, 'spec', 'fixtures', 'warranty.gif')
    click_button "Create"
  end

  @warranty = @current_user.warranties.last
end

Given /^I create an invalid warranty$/ do
  within('form') do
    click_button "Create"
  end
end

Given /^I upload an invalid file$/ do
  within('form') do
    attach_file "Warranty", File.join(Rails.root, 'spec', 'fixtures', 'invalid.xyz')
    click_button "Create"
  end
end

Then /^I should see a listing of my warranties$/ do
  @current_user.warranties.each do |warranty|
    page.should have_selector("li#warranty_#{warranty.id}")
    page.should have_content warranty.name
    page.should have_selector("img[src='#{warranty.warranty_url(:thumb)}']")
  end
end

Then /^I should not see a listing of warranties that belong to "([^"]*)"$/ do |email|
  user = User.find_by_email(email)
  user.warranties.each do |warranty|
    page.should_not have_selector("li#warranty_#{warranty.id}")
  end
end

Then /^I should see the warranty's detail page$/ do
  current_path.should == warranty_path(@warranty)
  # within_flash do
  #   page.should have_content("New warranty created.")
  # end
  page.should have_content(@warranty.name)
  page.should have_selector("img[src='#{@warranty.warranty_url(:thumb)}']")
end

When /^I cancel the creation$/ do
  click_link "Cancel"
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

