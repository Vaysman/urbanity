FactoryGirl.define do
  factory :player do
    first_name "Vasya"
    last_name "Pupkin"
    bio "Made by Factory Girl"
    sequence(:nick) { |n| "vp#{n}" }
    association :user, factory: :user_confirmed
  end
end
