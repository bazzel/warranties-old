Then /^I should see a "([^"]*)" popover for "([^"]*)"$/ do |name, value|
  page.should have_selector("i[rel='popover'][title='Notes'][data-content='<p>#{value}</p>']")
end
