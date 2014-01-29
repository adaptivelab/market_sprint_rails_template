Given(/^I have a page with slug, "(.*?)"$/) do |arg1|
  @page = FactoryGirl.create(:page, slug: arg1)
end

Given(/^I visit \/pages\/my_image$/) do
  visit "/pages/my_image"
end

Then(/^I see the image$/) do
  expect(page).to have_selector("img[src='#{@page.image_url}']")
end

Given(/^I am viewing a static image$/) do
  step 'I have a page with slug, "my_image"'
  step 'I visit /pages/my_image'
end

When(/^I click on the image$/) do
  find("a").click
end

Then(/^I am on the next page$/) do
  expect(page.current_url).to eql(FactoryGirl.attributes_for(:page)[:next_url])
end
