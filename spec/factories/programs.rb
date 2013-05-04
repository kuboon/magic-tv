# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :program do
    sequence(:uid){nil}
    url "http://example.com"
    name "TestProgram"
    channel "test channel"
    description "TestDescription"
    start_at { rand(100).hours.since }
    end_at nil
    status :public
  end
end
