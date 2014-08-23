FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "person#{n}@example.com" }
    password "password"
    password_confirmation { "password" }

    trait :confirmed do
      confirmed_at Time.now
    end

    trait :player do
      after(:build) do |user|
        FactoryGirl.create(:player, user: user)
      end
    end

    factory :user_confirmed, traits: [:confirmed]
    factory :user_with_player, traits: [:confirmed, :player]
  end
end
