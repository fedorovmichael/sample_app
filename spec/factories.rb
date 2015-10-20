FactoryGirl.define do
  factory :user do
    name     "User Test"
    email    "usertest@example.com"
    password "foobar"
    password_confirmation "foobar"
  end
end
