FactoryBot.define do
  factory :user, class: User do
    first_name { Faker::Name.neutral_first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    image { Faker::Avatar.image(slug: "my-own-slug", size: "50x50", format: "jpg") }
    google_id { Faker::Number.within(range: 100_000..999_999) }
    token { Faker::Number.within(range: 100_000..999_999) }
  end

  factory :omniauth_mock_user, parent: :user do
    first_name { 'John' }
    last_name { 'Johnson' }
    email { 'john@john.com' }
    image { 'https://lh4.googleusercontent.com/photo.jpg' }
    google_id { '100000000000000000000' }
    token { 'MOCK_OMNIAUTH_GOOGLE_TOKEN' }
  end
end
