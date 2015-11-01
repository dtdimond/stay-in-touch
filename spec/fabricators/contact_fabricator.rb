Fabricator(:contact) do
  contact_name{ Faker::Name.name }
  email{ Faker::Internet.email }
  phone{ Faker::PhoneNumber.phone_number}
end