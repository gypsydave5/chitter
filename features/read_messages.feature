Feature:
	In order to see what people have to say
	As a maker
	I want to see all chits in chronological order

Scenario: Two chits appearing in the right order
		Given that I am signed up and signed in as "weezard"
		When I click on "New Chit"
		And I fill in "chit_content" with "This is the exciting test chit of weezard"
		And I click on "Chit Away"
		And I click on "New Chit"
		And I fill in "chit_content" with "A follow up to that chit if I may..."
		And I click on "Chit Away"
		Then I should see "This is the exciting test chit of weezard" followed by "A follow up to that chit if I may"
