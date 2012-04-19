Given /^I have the following brands:$/ do |table|
  step %{a user with email "#{@current_user.email}" has the following brands:}, table
end

Given /^a user with email "([^"]*)" has the following brands:$/ do |email, table|
  step %{I have an account with email "#{email}"}

  table.map_headers! {|header| header.downcase.to_sym }

  table.hashes.each do |hash|
    hash[:user] = @current_user
    @user.brands << FactoryGirl.create(:brand, hash)
  end
end

Then /^I should have one brand$/ do
  @current_user.should have(1).brand
end

Then /^all my brands were deleted as well$/ do
  Brand.count.should == 0
end
