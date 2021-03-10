Feature: Does the vacancy have multiple locations

Description: As an employer, I need to be able to state whether vacancies within a role are
available across multiple locations, so that I can reach the right claimants at the right locations
- Link to prototype: https://kickstart-assessment.herokuapp.com/employer/mvp/job-add-3b-locally
- Link to User Story: https://jira.service.dwpcloud.uk/browse/KICK-914

Definitions:
- User: an employer applying for a kickstart scheme grant
- Vacancy: a vacancy that an employer is creating to surface to claimants
- Location: the location in which the vacancy will be advertised

Flow:
  - Previous page is Where will this job be based [KICK-905]
  - Next page is Add Multiple Locations if user wants to add multiple locations [KICK-1071]
  - Next page is Add Single Location if user wants to add single location [KICK-1053]

Scenarios

# Back

Scenario: User clicks on the back link
  Given that I am a User who is on the "Does the vacancy have multiple locations" page
  When the User clicks  "Back"
  Then the User must be redirected to the page requiring me to enter where the job will be based [KICK-905]


# Yes, more than one location

Scenario: User states that the vacancy has multiple locations
  Given that the User selects "Yes, more than one location"
  When the User clicks  "Continue"
  Then the User must be redirected to the page requiring me to enter multiple locations [KICK-1071]


# No, only one location

Scenario: User states that the vacancy has multiple locations
  Given that the User selects "No, only one location"
  When the User clicks  "Continue"
  Then the User must be redirected to the page requiring me to enter a single location [KICK-1053]


# No options selected

Scenario: User does not select an option
  Given that the User does not select an option
  When the User clicks  "Continue"
  Then the form is invalid
  And an error summary heading is shown as "There is a problem"
  And an error summary list descriptive link is shown as "Select an option"


# Sign Out

Scenario: User can sign out
  Given that a User is within the Applicant service
  When the User clicks the 'Sign out' Link
  Then the User must be signed out of the service [KICK-XXXX]
