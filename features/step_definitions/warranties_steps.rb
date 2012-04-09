Given /^I have the following warranties:$/ do |table|
  table.map_headers! {|header| header.downcase.to_sym }
  table.map_column!('warranty') {|warranty| File.open(File.join(Rails.root, 'spec', 'fixtures', warranty)) }

  @warranties = []

  table.hashes.each do |hash|
    @warranties << FactoryGirl.create(:warranty, hash)
  end
end

Given /^I create a valid warranty$/ do
  within('form') do
    fill_in "Name", :with => "Lamp"
    fill_in "Expires on", :with => 2.years.from_now
    attach_file "Warranty", File.join(Rails.root, 'spec', 'fixtures', 'warranty.gif')
    click_button "Create"
  end

  @warranty = Warranty.last
end

Then /^I should see a listing of my warranties$/ do
  save_and_open_page
  @warranties.each do |warranty|
    page.should have_content warranty.name
    page.should have_selector("img[src='#{warranty.warranty_url(:thumb)}']")
  end
end

Then /^I should see the warranty's detail page$/ do
  current_path.should == warranty_path(@warranty)
  within_flash do
    page.should have_content("New warranty created.")
  end
  page.should have_content(@warranty.name)
  page.should have_selector("img[src='#{@warranty.warranty.url}']")
end

Given /^I create an invalid warranty$/ do
  within('form') do
    click_button "Create"
  end
end

When /^I cancel the creation$/ do
  click_link "Cancel"
end

Then /^I should see that the warranty is invalid$/ do
  within('form') do
    page.should have_content("can't be blank")
  end
end
