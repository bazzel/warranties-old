FactoryGirl.define do
  factory :warranty do
    name "Foo"
    warranty  { File.open(File.join(Rails.root, 'spec', 'fixtures', 'warranty.gif')) }
    expires_on 2.years.from_now
  end
end
