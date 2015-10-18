Given(/^A company called "([^"]*)" has been added$/) do |company_name|
  Company.create(name: company_name)
end

When(/^I visit the homepage$/) do
  visit '/'
end

Then(/^I should see "([^"]*)"$/) do |text|
  expect(page).to have_content text
end