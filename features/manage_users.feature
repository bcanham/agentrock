Feature: Signup
	As a user
	I need to signup
	So that I can share notes
	
	Scenario: Signup
		Given that I am not a user
		When I go to the signup page
		Then I should see "Sign up"
		When I fill in "Username" with "oogabooga"
		And I fill in "Email" with "ooga@booga.nom"
		And I fill in "Password" with "oogabooga"
		And I fill in "Password Confirmation" with "oogabooga"
		And I press "Sign up"
		Then I should have a successful signup

		
	
	Scenario: Confirm Email