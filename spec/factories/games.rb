FactoryGirl.define do
  factory :game do
    name "Factory Game"
    start "2014-09-07 19:06:10"
    registration_end "2014-09-07 19:06:10"
    max_number_of_teams 3
    min_number_of_teams 2
    association :creator, factory: :player
  end
end
