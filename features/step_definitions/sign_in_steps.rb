Given(/^I have registered$/) do
  step "I find myself on the sign-up page"
  step "I enter in the right information"
  step "I click Sign up"
  step "I click Sign Out"
end

When(/^I find myself on the sign\-in page$/) do
  visit new_user_session_path
end

When(/^I re\-enter my details$/) do
  fill_in "user_email", with: "test@example.com"
  fill_in "user_password", with: "testing"
end

When(/^I click Sign in$/) do
  click_on "Sign in"
end

Then(/^I should be signed in$/) do
  expect(page).to have_content("Sign out")
end
