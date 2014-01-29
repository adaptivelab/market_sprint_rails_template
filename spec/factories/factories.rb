# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do

  factory :user do
    email "test@example.com"
    password "tester"
    password_confirmation "tester"
  end

  factory :page do
    slug "example_page"
    title "Example Page"
    next_url "http://next.com/"
    image_url "http://www.tehcute.com/pics/201110/marshmellow-kitten-big.jpg"
    layout "empty"

    trait :no_layout do
      layout ""
    end
  end

end
