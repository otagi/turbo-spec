FactoryBot.define do
  factory :rodent do
    sequence(:name) { |n| "Rodent #{n}" }
  end
end
