Feature: Signup
# 	As a user
# 	I need to signup
# 	So that I can share notes
# 	
# 	Scenario: Signup
# 		Given that I am not a user
# 		When I go to the signup page
# 		Then I should see "Sign up"
# 		When I fill in "Username" with "oogabooga"
# 		And I fill in "Email" with "ooga@booga.nom"
# 		And I fill in "Password" with "oogabooga"
# 		And I fill in "Password Confirmation" with "oogabooga"
# 		And I press "Sign up"
# 		Then I should have a successful signup
# 
# 		
# 	
# 	Scenario: Confirm Email

Scenario Outline: Creating a new account
    Given I am not authenticated
    When I go to register # define this path mapping in features/support/paths.rb, usually as '/users/sign_up'
    And I fill in "user_email" with "<email>"
    And I fill in "user_password" with "<password>"
    And I fill in "user_password_confirmation" with "<password>"
    And I press "Sign up"
    Then I should see "logged in as <email>" # your work!

    Examples:
      | email           | password   |
      | testing@man.net | secretpass |
      | foo@bar.com     | fr33z3     |