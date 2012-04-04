FactoryGirl.define do
  sequence :email do |n|
    "person#{n}@example.com"
  end

  factory :user do
    sequence(:email) {|n| "person#{n}@example.com" }
    password "Secret.1"
  end
end
