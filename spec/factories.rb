FactoryGirl.define do
  factory :user do
    username { Faker::Internet.user_name }
    email { Faker::Internet.email }
    password 'password'
  end

  factory :topic do
    title {Faker::Lorem.sentence(1)}
    content {Faker::Lorem.paragraph(5)}
    user
  end

  factory :user_with_topics, :parent => :user do
    after(:create) do |u|
      3.times {
        create(:topic, :user => u)
      }
    end
  end

  factory :unassigned_score, :class => Score do
    actionable -2
    specific 1
    kind 0
  end

  factory :score do
    user
    topic
    actionable -2
    specific 1
    kind 0
  end

  factory :invalid_score, :class => Score do
    user
    topic
    actionable 3
    specific 8
    kind -6
  end

end
