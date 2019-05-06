FactoryBot.define do
  sequence :user_email do |n|
    "test#{n}@example.com"
  end
  sequence :admin_email do |n|
    "admin#{n}@example.com"
  end

  factory :user do
    first_name { 'John' }
    last_name { 'Doe' }
    email { generate :user_email }
    password { 'asdf123' }
    password_confirmation { 'asdf123' }
  end

  factory :admin_user do
    first_name { 'Admin' }
    last_name { 'User' }
    email { generate :admin_email }
    password { 'asdf123' }
    password_confirmation { 'asdf123' }
  end
end