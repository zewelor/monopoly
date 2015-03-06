FactoryGirl.define do
  factory :player do
    sequence(:name) { |n| "player_#{n}"}
  end
end