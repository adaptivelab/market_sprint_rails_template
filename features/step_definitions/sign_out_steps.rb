Given(/^I'm logged in$/) do
  step "I find myself on the sign-up page"
  step "I enter in the right information"
  step "I click Sign up"
end

When(/^I click Sign Out$/) do
  click_on "Sign out"
end

Then(/^I should not see the Sign Out option any more$/) do
  expect(page).to have_no_content("Sign out")
end