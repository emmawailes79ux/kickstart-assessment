Feature: Enter Security Code

Description: As an employer, I need to be able to enter my security code, so that I can confirm that I am in possession of my email
  - Link to prototype: https://kickstart-assessment.herokuapp.com/employer/mvp/sign-in-2fa
  - User could be either an Employer or a Gateway
  - Jira story: https://jira.service.dwpcloud.uk/browse/KICK-1048

Flow:
  - If user is successful, then next page is to add vacancies [KICK-903]

Scenario: User enters a Security Code
  Given that I am an employer confirming who I am
  And I enter my security code
  When I click 'Continue'
  Then the system must verify that the security code is the same as what was emailed to me

Scenario: User does not enter Security Code
  Given that I am an employer confirming who I am
  When I click 'Continue' without entering my Security Code
  Then the Security Code is invalid
  And an error summary heading is shown: "There is a problem"
  And an error summary list descriptive link is shown as "Enter a security code"

Scenario: User enters an invalid security code
  Given that I am an employer confirming who I am
  And I enter a security code that does not match what was emailed to me
  When I click 'Continue'
  Then the Security Code is invalid
  And an error summary heading is shown: "There is a problem"
  And an error summary list descriptive link is shown as "Enter a valid security code"

Scenario: User enters a valid security code
  Given that I am an employer confirming who I am
  And I enter a security code that matches what was emailed to me
  When I click 'Continue'
  Then I need to be redirected to the page to add vacancies [KICK-903]
