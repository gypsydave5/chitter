Feature: Sign up
	In order to use chitter
	As a maker
	I want to sign up to the service

	Scenario: Arriving on the website
		Given that I am on the Chitter home page
		Then I should see 'Chitter'

	Scenario: Visiting the sign up page
		Given that I am on the Chitter home page
		When I click on "Sign up"
		Then I should see "Sing in to Chitter"

	Scenario: Signing up to Chitter
		Given that I am on the Chitter sign up page
		When I fill in 'user name' as 'weezard'
