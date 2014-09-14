Feature: Sign up
	In order to use chitter
	As a maker
	I want to sign up to the service

	Scenario: Arriving on the website
		Given that I am on the Chitter home page
		Then I should see "Chitter"

	Scenario: Visiting the sign up page
		Given that I am on the Chitter home page
		When I click on "Sign up"
		Then I should see "Sign in to Chitter"

	Scenario: Signing up to Chitter
		Given that I am on the Chitter sign up page
		When I fill in "username" with "weezard"
		And I fill in "email" with "weezard@giraffes.com"
		And I fill in "password" with "1337pass"
		And I fill in "password_confirmation" with "1337pass"
		And I click on "Join Chitter"
		Then I should see "Hi weezard!"
		And I should be on the Chitter home page

	Scenario: Signing up with a username that is already taken
		Given that I am on the Chitter sign up page
		And that a user exists with the username of "weezard" and email of "weezard@giraffes.com"
		When I sign up with a user name of "weezard" and an email address of "happy@happy.com"
		Then I should see "Username is already taken"
		And I should see "happy@happy.com" in the "email" field
		And I should be on the Chitter sign up page

	Scenario: Signing up with an email address that is already in use
		Given that I am on the Chitter sign up page
		And that a user exists with the username of "weezard" and email of "weezard@giraffes.com"
		When I sign up with a user name of "brian" and an email address of "weezard@giraffes.com"
		Then I should see "That email address is already in use - have you forgotten your password?"
		And I should see "brian" in the "username" field
		And I should be on the Chitter sign up page
