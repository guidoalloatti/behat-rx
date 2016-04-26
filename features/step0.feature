Feature: Step0 Validations
  In order to see complete the registration
  As a website user
  I need to be able to complete step 0 

  @javascript
  Scenario: I am on the proper page
    Given I am on the homepage
    Then I should see "It’s free to join Rxvantage, sign up below!"
    And I should see "Password must be 8 digits long and contain:"
    And I should see "Upper and lower-case letters"
    And I should see "At least one number"
    And I should see "At least one special character"
    And I should see "I have read and agree to the Rxvantage Terms of Service"
    And I should see " Already on RxVantage?"

  @javascript
  Scenario: The Join RxVantage button should be disabled
    Given I am on the homepage
    Then the button "signup-submit" should be disabled

  @javascript 
  Scenario: The first name is required and needs to have more that 1 char
    Given I am on the homepage
    When I fill in "signup-first-name" with "A"
    Then I should see "First name is too short."
    Then I fill in "signup-first-name" with ""
    Then I should see "First name is required."

  @javascript 
  Scenario: The last name is required and needs to have more that 1 char
    Given I am on the homepage
    When I fill in "signup-last-name" with "A"
    Then I should see "Last name is too short."
    Then I fill in "signup-last-name" with ""
    Then I should see "Last name is required."

  @javascript 
  Scenario: The last name is required and needs to have more that 1 char
    Given I am on the homepage
    When I fill in "signup-company" with "a"
    Then I should see "Company name is too short."
    When I fill in "signup-company" with ""
    Then I should see "Company is required."
    When I fill in "signup-company" with "xeerasfdasdfasdf"
    And I wait for 3 seconds
    Then I should see "Company was not found."

  @javascript 
  Scenario: The job title is required and needs to have more that 1 char
    Given I am on the homepage
    When I fill in "signup-job-title" with "A"
    Then I should see "Job title is too short."
    Then I fill in "signup-job-title" with ""
    Then I should see "Job title is required."    

  @javascript 
  Scenario: The phone number should be exactly 10 digits
    Given I am on the homepage
    When I fill in "signup-mobile-number" with "1"
    Then I should see "Mobile number is too short."
    When I fill in "signup-mobile-number" with ""
    Then I should see "Mobile number is required."
    When I fill in "signup-mobile-number" with "12345678901"
    Then I should see "Mobile number is too long."

  @javascript 
  Scenario: The email address should be valid
    Given I am on the homepage
    When I fill in "signup-email" with "a"
    Then I should see "Invalid email address."
    When I fill in "signup-email" with ""
    Then I should see "Email is required."
    When I fill in "signup-email" with "guido@info.com"
    And I wait for 3 seconds 
    Then I should see "Email address is already taken."

  @javascript 
  Scenario: The confirmation email address should be valid
    Given I am on the homepage
    When I fill in "signup-email-confirm" with "a"
    Then I should see "Invalid email address."
    When I fill in "signup-email-confirm" with ""
    Then I should see "Email is required."
    When I fill in "signup-email" with "guido@rxvantage.com"
    Then I fill in "signup-email-confirm" with "mark@rxvantage.com"
    Then I should see "Confirm Email does not match."

  @javascript 
  Scenario: The password is required and needs to have more that 8 chars
    Given I am on the homepage
    When I fill in "signup-password" with "a"
    Then I should see "Password is too short."
    Then I fill in "signup-password" with ""
    Then I should see "Password is required."

  @javascript 
  Scenario: The submit button should be enabled when all the fields are valid
    Given I am on the homepage
    When I fill in "signup-first-name" with "Al"
    Then the button "signup-submit" should be disabled
    And I fill in "signup-last-name" with "Bert"
    Then the button "signup-submit" should be disabled
    And I fill in "signup-company" with "3M"
    Then the button "signup-submit" should be disabled
    And I fill in "signup-job-title" with "Doctor"
    Then the button "signup-submit" should be disabled
    And I fill in "signup-mobile-number" with "1234567890"
    Then the button "signup-submit" should be disabled
    And I fill in "signup-email" with "testing-behat@rxvantage.com"
    Then the button "signup-submit" should be disabled
    And I fill in "signup-email-confirm" with "testing-behat@rxvantage.com"
    Then the button "signup-submit" should be disabled
    And I fill in "signup-password" with "A123123123rxvantage!"
    And I wait for 3 seconds
    Then the button "signup-submit" should be enabled