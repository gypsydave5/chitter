Feature:
	In order to avoid others to use my account
	As a maker
	I want to log out

	Scenario: Logging out
		Given that I am on the Chitter sign up page
		When I sign up with a user name of "chunky_bacon" and an email address of "chunky@bacon.com"
		And I go to the Chitter home page
		And I click on "Sign out"
		Then I should see "Be seeing you"
		And I should not see "Hi chunky_bacon"
		And I should not see "Sign out"
