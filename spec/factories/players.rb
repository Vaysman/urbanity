FactoryGirl.define do
  factory :player do
    first_name "Vasya"
    last_name "Pupkin"
    bio "Made by Factory Girl"
    nick "vp"
    association :user, factory: :user_confirmed
  end
end
