# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do

  factory :user do

    email "test@example.com"
    password "tester"
    password_confirmation "tester"
  end

end