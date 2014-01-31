Given(/^I find myself on the sign\-up page$/) do
  visit new_user_registration_path
end

And(/^I enter in the right information$/) do
  fill_in "user_email", :with => "test@example.com"
  fill_in "user_password", :with => "testing"
  fill_in "user_password_confirmation", :with => "testing"
end

When(/^I click Sign up/) do
  click_on "Sign up"
end

Then(/^I should be signed up and signed in$/) do
  step "I should be signed in"
end
