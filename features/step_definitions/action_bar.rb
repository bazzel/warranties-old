Then /^I see the following items in the action bar:$/ do |table|
  table.map_column!('visible') { |v| v == "true" }
  table.map_column!('name') do |name|
    case name
    when "Search" then "search_name_contains"
    else               name
    end
  end
  within('#action-bar') do
    table.hashes.each do |hash|
      (page.has_link?(hash["name"]) || page.has_field?(hash["name"])).should == (hash["visible"])
    end
  end

end
