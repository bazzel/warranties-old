Given /^I create a valid warranty$/ do
  within('form') do
    fill_in "Name", :with => "Lamp"
    attach_file "Warranty", File.join(Rails.root, 'spec', 'fixtures', 'warranty.gif')
    click_button "Create"
  end

  @warranty = Warranty.last
end

Then /^I should see the warranty's detail page$/ do
  current_path.should == warranty_path(@warranty)
  within('.alert-box') do
    page.should have_content("New warranty created.")
  end
  page.should have_content(@warranty.name)
  page.should have_selector("img[src='#{@warranty.warranty.url}']")
end
