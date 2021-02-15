Feature: Advertise this job locally + state whether it covers multiple locations

Description: As an employer, I need to be able to choose whether I want to
advertise my job locally or nationally, so that I can reach the right claimants.
  - Link to prototype: https://kickstart-assessment.herokuapp.com/employer/mvp/job-add-3b
  - Jira stories related to this feature: https://jira.service.dwpcloud.uk/browse/KICK-1052

Definitions:
  - Anticipated Start Date: The date that the vacancy is expected to start
  - Advertising Start Date: The date for the vacancy to start being advertised
  - Closing Date: The date that the vacancy is set to be closed

Flow:
  - Previous page is Where will this job be based [KICK-905]
  - Next page is Add Multiple Locations if user wants to add multiple locations [KICK-1071]
  - Next page is Add Single Location if user wants to add single location [KICK-1053]

#Back

Scenario: User clicks the "Back" button
  Given that the User is entering the dates of their vacancy
  When the User clicks the "Back" link
  Then the User must be redirected back to the page asking the user where the job will be based [KICK-905]

# Yes

Scenario: User selects "Yes, I only want people close by to this location"
  Given that the User is stating whether they want to advertise their job locally
  And selects "Yes, I only want people close by to this location"
  When the User clicks "Continue"
  Then the field is valid

# No

Scenario: User selects "No, I can employ people from all over the UK for this job"
  Given that the User is stating whether they want to advertise their job locally
  And selects "No, I can employ people from all over the UK for this job"
  When the User clicks "Continue"
  Then the field is valid

# Multiple locations

Scenario: User selects "Yes, more than one location"
  Given that the User is stating whether the job requires employees to work from multiple locations
  And selects "Yes, more than one location"
  When the User clicks "Continue"
  Then the field is valid
  And the User must be redirected to the page to add multiple locations [KICK-1071]

Scenario: User selects "No, only one location"
  Given that the User is stating whether the job requires employees to work from multiple locations
  And selects "No, only one location"
  When the User clicks "Continue"
  Then the field is valid
  And the User must be redirected to the page to add a single location [KICK-1053]


# Sign Out

Scenario: User can sign out
  Given that a User is within the Applicant service
  When the User clicks the 'Sign out' Link
  Then the User must be signed out of the service [KICK-XXXX]
