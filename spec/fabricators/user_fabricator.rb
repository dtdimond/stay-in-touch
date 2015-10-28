Fabricator(:user) do
  username { Faker::Internet.email }
  password { Faker::Internet.password(10) }
  name { Faker::Name.name }
end