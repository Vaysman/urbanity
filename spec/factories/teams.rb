FactoryGirl.define do
  factory :team do
    name "Factory Girls"
    association :captain, factory: :player
  end
end
