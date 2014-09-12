Given(/^that I am on the Chitter sign up page$/) do
	visit '/users/signup'
end

Given(/^that I am on the Chitter home page$/) do
	visit '/'
end

When(/^I click on "(.*?)"$/) do |arg1|
	click_on arg1
end

Then(/^an email should be sent to "(.*?)"$/) do |arg1|
	expect(Chitter).to receive(:send_email).with (arg1)
end

Given(/^that a user exists with the "(.*?)" of "(.*?)"$/) do |arg1, arg2|
end

When(/^I sign up with a user name of "(.*?)" and an email address of "(.*?)"$/) do |arg1, arg2|
	steps %Q{
		When I fill in "user name" with "arg1"
		And I fill in "email address" with "arg2"
		And I click on "Sign up"
	}
end

