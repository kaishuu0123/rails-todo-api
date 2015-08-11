FactoryGirl.define do
  factory :todo do
    sequence(:title) {|n| "title #{n}"}
  end
end
