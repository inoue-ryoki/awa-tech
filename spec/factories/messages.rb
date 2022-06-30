FactoryBot.define do
  factory :message do
    content { 'test' }
    association :user
    association :room
  end
end
