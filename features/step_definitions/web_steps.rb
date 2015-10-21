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

Then(/^I should see:$/) do |table|
  values = table.raw.flatten
  values.each do |value|
    expect(page).to have_content value
  end
end

Given(/^I want to visit a page that does not exist$/) do
  visit '/some_random_uri'
end

Then(/^I shoud be informed that the page could not be found$/) do
  expect(page).to have_content 'Page Not Found'
end

When(/^I visit "([^"]*)"$/) do |url|
  visit url
end

Given(/^There is no company in the DB$/) do
  expect(Company.all.to_a.empty?).to be true
end
