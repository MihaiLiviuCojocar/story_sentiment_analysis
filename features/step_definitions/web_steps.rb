Given(/^A company$/) do |table|
  data = table.raw.transpose.to_h
  Company.create(name: data["name"], tickerCode: data["ticker_code"])
end

When(/^I visit the homepage$/) do
  visit '/'
end

Then(/^I should see "([^"]*)"$/) do |text|
  expect(page).to have_content text
end

When(/^I click on "([^"]*)"$/) do |link|
  click_link link
end

Then(/^I should be on the "([^"]*)" card page$/) do |company_name|
  ticker_code = Company.where(name: company_name).first.tickerCode
  expect(page.status_code).to eq 200
  expect(page.current_path).to eq "/companies/#{ticker_code}"
end