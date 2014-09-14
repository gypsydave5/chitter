Feature: Log in
	In order to user chitter
	As a maker
	I want to log in

Scenario: Going to the log in page in from the home page
		Given that I am on the Chitter home page
		When I click on "Log in"
		Then I should see "Please enter your username and password"

Scenario: Logging in with valid credentials
		Given that a user exists with the username of "weezard" and password of "WEEZARDS"
		And I am on the Chitter log in page
		When I fill in "username" with "weezard"
		And I fill in "password" with "WEEZARDS"
		And I click on "Log me in"
		Then I should be on the Chitter home page
		And I should see "Hi weezard!"

Scenario: Logging in with an invalid password
		Given that a user exists with the username of "weezard" and password of "WEEZARDS"
		And I am on the Chitter log in page
		When I fill in "username" with "weezard"
		And I fill in "password" with "chunkybaconchunkybacon"
		And I click on "Log me in"
		Then I should be on the Chitter log in page
		And I should see "Incorrect username or password"

Scenario: Logging in with an invalid username
		Given that a user exists with the username of "weezard" and password of "WEEZARDS"
		And I am on the Chitter log in page
		When I fill in "username" with "elfwithham"
		And I fill in "password" with "WEEZARDS"
		And I click on "Log me in"
		Then I should be on the Chitter log in page
		And I should see "Incorrect username or password"
