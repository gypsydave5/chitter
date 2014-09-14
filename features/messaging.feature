Feature:
	In order to let people know what I am doing
	As a maker
	I want to post a message to chitter

	Scenario: seeing the new chit button
		Given that I am on the Chitter home page
		And I am not logged in
		Then I should not see the "New Chit" button

	Scenario: Going to the new chit page
		Given that I am signed up and signed in as "weezard"
		When I click on "New Chit"
		Then I should be on the new chit page
		And I should see "Chit about what's going on, weezard"

	Scenario: Making a new chit
		Given that I am signed up and signed in as "weezard"
		When I click on "New Chit"
		And I fill in "chit_content" with "This is the exciting test chit of weezard"
		And I click on "Chit Away"
		Then I should be on the Chitter home page
		And I should see "This is the exciting test chit of weezard"


