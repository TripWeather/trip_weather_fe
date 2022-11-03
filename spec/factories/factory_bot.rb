FactoryBot.define do
  factory :user, class: User do
    first_name { Faker::Name.neutral_first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    image { Faker::Avatar.image(slug: "my-own-slug", size: "50x50", format: "jpg") }

  end
end
