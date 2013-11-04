Feature: Student account in the ImagineWare course platform

  As a returning ImagineWare student
  I want to have an account in the ImagineWare platform
  So that I can keep track of what courses I've taken
  
  Background:
    	Given the following users exist:
	| first_name | last_name | email               | password   |
	| Ryan       | Wilson    | hotmale@hotmail.com | ilovebacon |

  Given I am on the home page

  Scenario: Create an account for the first time
    Then I should see "Sign up now!"
    When I follow "Sign up now!"
    When I fill in "user_first_name" with "Sebastian"
    When I fill in "user_last_name" with "Delgado"
    When I fill in "user_email" with "sd@gmail.com"
    When I fill in "user_password" with "goodbye"
    When I fill in "user_password_confirmation" with "goodbye"
    When I press "Create my account"
    Then I should see "Sebastian"

  Scenario: Create an account entering mismatched passwords
    Then I should see "Sign up now!"
    When I follow "Sign up now!"
    When I fill in "user_first_name" with "Sebastian"
    When I fill in "user_last_name" with "Delgado"
    When I fill in "user_email" with "sd@gmail.com"
    When I fill in "user_password" with "goodbye"
    When I fill in "user_password_confirmation" with "g00dbye"
    When I press "Create my account"
    Then I should see "You did not enter all the fields correctly"

  Scenario: Sign into account and see grades
    Then I should see "Sign in"
    When I follow "Sign in"
    Then I fill in "session_email" with "hotmale@hotmail.com"
    Then I fill in "session_password" with "ilovebacon"
    Then I press "Sign in"
    Then I should see "Ryan"

  Scenario: Sign into account using mismatched email/password combination
    Then I should see "Sign in"
    When I follow "Sign in"
    Then I fill in "session_email" with "hotmale@hotmail.com"
    Then I fill in "session_password" with "il0vebacon"
    Then I press "Sign in"
    Then I should see "Invalid email/password combination"
