Then /^I see the following items in the action bar:$/ do |table|
  table.map_column!('visible') { |v| v == "true" }
  within('#action-bar') do
    table.hashes.each do |hash|
      if hash["visible"]
        page.should have_link(hash["name"])
      else
        page.should have_no_link(hash["name"])
      end
    end
  end

end
