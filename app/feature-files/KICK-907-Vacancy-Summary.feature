Feature: Summary Page

Description: As an employer, I need to view a summary of my role details before adding a role to my vacancy list on the Applicant Service, to ensure that I am adding the right role details to reach claimants
- Link to prototype: https://kickstart-assessment.herokuapp.com/employer/mvp/job-detail
- Link to JIRA: https://jira.service.dwpcloud.uk/browse/KICK-907

Flow:
- Previous page is Hours and Pay [KICK-906]
- Next page is vacancy addition confirmation [KICK-908]

Scenarios

# Summary Page

Scenario: User is displayed a summary page of all the values
Given that the User is who is adding their vacancy details and arrive at the summary page
When the User arrive at the following page
Then the User needs to be able to view all of the values the User entered in the service

# Back

Scenario: User clicks on the back link
  Given that I am a User who is on the Vacancy Summary page
  When I click "Back"
  Then I must be redirected to the page requiring me to enter a vacancy's hours and pay [KICK-906]


# Vacancy Details

Scenario: User chooses to change the "Job Title" value
  Given that the User is reviewing their role details
  When the User clicks the 'Change' link on the "Job Title" value
  Then the User needs to be redirected to the page to change their Job Title [KICK-904] and be redirected back to this page once that value has been changed

Scenario: User chooses to change the "Number of Vacancies"
  Given that the User is reviewing their role details
  When the User clicks the 'Change' link on the "Number of Vacancies" value
  Then the User needs to be redirected to the page to change their number of vacancies value [KICK-904] and be redirected back to this page once that value has been changed

Scenario: User chooses to change the "Referral cap" value
  Given that the User is reviewing their role details
  When the User clicks the 'Change' link on the "Referral Cap" value
  Then the User needs to be redirected to the page to change their Referral cap value [KICK-904] and be redirected back to this page once that value has been changed

Scenario: User chooses to change the "Industry sector" value, where it has been entered
  Given that the User is reviewing their role details
  When the User clicks the 'Change' link on the "Industry sector" value
  Then the User needs to be redirected to the page to change their Industry sector value [KICK-904] and be redirected back to this page once that value has been changed

Scenario: User chooses to change the "Internal job reference" value, where it has been entered
  Given that the User is reviewing their role details
  When the User clicks the 'Change' link on the "Internal job reference" value
  Then the User needs to be redirected to the page to change their Internal job reference value [KICK-904] and be redirected back to this page once that value has been changed

Scenario: User chooses to change the "Contact name" value
  Given that the User is reviewing their role details
  When the User clicks the 'Change' link on the "Contact name" value
  Then the User needs to be redirected to the page to change their Contact name value [KICK-904] and be redirected back to this page once that value has been changed

Scenario: User chooses to change the "Phone" value
  Given that the User is reviewing their role details
  When the User clicks the 'Change' link on the "Phone" value
  Then the User needs to be redirected to the page to change their Phone value [KICK-904] and be redirected back to this page once that value has been changed

Scenario: User chooses to change the "Email" value
  Given that the User is reviewing their role details
  When the User clicks the 'Change' link on the "Email" value
  Then the User needs to be redirected to the page to change their Email value [KICK-904] and be redirected back to this page once that value has been changed


# Vacancy Advert

Scenario: User chooses to change the "About the job" value
  Given that the User is reviewing their role details
  When the User clicks the 'Change' link on the "About the job" value
  Then the User needs to be redirected to the page to change their "About the job" value [KICK-913] and be redirected back to this page once that value has been changed

Scenario: User chooses to change the "What are you looking for?" value
  Given that the User is reviewing their role details
  When the User clicks the 'Change' link on the "What are you looking for?" value
  Then the User needs to be redirected to the page to change their "What are you looking for" value [KICK-913] and be redirected back to this page once that value has been changed

Scenario: User chooses to change the "Tell us about your company" value
  Given that the User is reviewing their role details
  When the User clicks the 'Change' link on the "Tell us about your company" value
  Then the User needs to be redirected to the page to change their "Tell us about your Company" value [KICK-913] and be redirected back to this page once that value has been changed

Scenario: User chooses to change the "Role base" value
  Given that the User is reviewing their role details
  When the User clicks the 'Change' link on the "Role base" value
  Then the User needs to be redirected to the page to change their Role base value [KICK-913] and be redirected back to this page once that value has been changed

Scenario: User chooses to change the "What can you offer the Kickstarter?" value
  Given that the User is reviewing their role details
  When the User clicks the 'Change' link on the "What can you offer the Kickstarter" value
  Then the User needs to be redirected to the page to change their What can you offer the Kickstarter value [KICK-913] and be redirected back to this page once that value has been changed

Scenario: User chooses to change the "How to apply" value
  Given that the User is reviewing their role details
  When the User clicks the 'Change' link on the "How to apply" value
  Then the User needs to be redirected to the page to change their How to apply value [KICK-913] and be redirected back to this page once that value has been changed


# Dates

Scenario: User chooses to change the "Anticipated start date" value
  Given that the User is reviewing their role details
  When the User clicks the 'Change' link on the "Anticipated start date" value
  Then the User needs to be redirected to the page to change their Anticipated start date value [KICK-1051] and be redirected back to this page once that value has been changed


Scenario: User chooses to change the "Advertising start date" value
  Given that the User is reviewing their role details
  When the User clicks the 'Change' link on the "Advertising start date" value
  Then the User needs to be redirected to the page to change their Advertising start date value [KICK-1051] and be redirected back to this page once that value has been changed


Scenario: User chooses to change the "Closing date for applications" value
  Given that the User is reviewing their role details
  When the User clicks the 'Change' link on the "Closing date" value
  Then the User needs to be redirected to the page to change their closing date value [KICK-1051] and be redirected back to this page once that value has been changed


# Job Base?

Scenario: User chooses to change the "Where will the job be based?" value
  Given that the User is reviewing their role details
  When the User clicks the 'Change' link on the "Where will the job be based?" value
  Then the User needs to be redirected to the page to change the value for where the job will be based [KICK-905]


# Location

Scenario: User chooses to change the "Multiple Locations?" value from "No" to "Yes"
  Given that the User is reviewing their role details
  When the User clicks the 'Change' link on the "Multiple locations?" value
  Then the User needs to be redirected to the page to change the Multiple locations? value [KICK-914], be asked to enter multiple locations [KICK-1071], and then be redirected to this page once these values have been changed.

Scenario: User chooses to change the "Multiple Locations?" value from "Yes" to "No"
  Given that the User is reviewing their role details
  When the User clicks the 'Change' link on the "Multiple locations?" value
  Then the User needs to be redirected to the page to change the Multiple locations? value [KICK-914], be asked to enter a single location [KICK-1053], and then be redirected to this page once these values have been changed.

Scenario: User chooses to change the "Address" value
  Given that the User is reviewing their role details
  When the User clicks the 'Change' link on the "Address" value
  Then the User needs to be redirected to the page to change the Address value [KICK-1053] and be redirected back to this page once that value has been changed

Scenario: User chooses to change the "Address" value where multiple addresses exist
  Given that the User is reviewing their role details
  When the User clicks the 'Change' link on the "Address" value
  Then the User needs to be redirected to the page to change the Address values [KICK-1071] and be redirected back to this page once that value has been changed

Scenario: User chooses to change the "Postcode" value
  Given that the User is reviewing their role details
  When the User clicks the 'Change' link on the "Postcode" value
  Then the User needs to be redirected to the page to change the Postcode value [KICK-906] and be redirected back to this page once that value has been changed


# Hours and Pay

Scenario: User chooses to change the "Total Hours Per Week" value
  Given that the User is reviewing their role details
  When the User clicks the 'Change' link on the "Total Hours Per Week" value
  Then the User needs to be redirected to the page to change their Total Hours Per Week value [KICK-906] and be redirected back to this page once that value has been changed

Scenario: User chooses to change the "Days" value
  Given that the User is reviewing their role details
  When the User clicks the 'Change' link on the "Days" value
  Then the User needs to be redirected to the page to change their Days value [KICK-906] and be redirected back to this page once that value has been changed

Scenario: User chooses to change the "Hours" value
  Given that the User is reviewing their role details
  When the User clicks the 'Change' link on the "Hours" value
  Then the User needs to be redirected to the page to change their Hours value [KICK-906] and be redirected back to this page once that value has been changed

Scenario: User chooses to change the "Pay" value
  Given that the User is reviewing their role details
  When the User clicks the 'Change' link on the "Pay" value
  Then the User needs to be redirected to the page to change their Pay value [KICK-906] and be redirected back to this page once that value has been changed


# Confirm Role

Scenario: User chooses to select the "Confirm role" value
  Given that the User is reviewing their role details
  When the User clicks the "Confirm role" value
  Then the User needs to be redirected to the page confirming that their role has been added [KICK-908]

# Sign Out

Scenario: User can sign out
  Given that a User is within the Applicant service
  When the User clicks the 'Sign out' Link
  Then the User must be signed out of the service [KICK-XXXX]
