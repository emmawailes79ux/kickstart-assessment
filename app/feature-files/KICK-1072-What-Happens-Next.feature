Feature: All vacancies completed confirmation & next steps

Description: Once vacancies are submitted by the user a confirmation page is shown with next steps.
- Link to prototype: https://kickstart-assessment.herokuapp.com/employer/mvp/app-sent
- Link to JIRA: https://jira.service.dwpcloud.uk/browse/KICK-1072

Flow:
- This is the end of the vacancy flow
- User can sign out [KICK-XXXX]

Scenarios:

# Next Steps

Scenario: User can see their Application ID
  Given that a User has added all of the roles for their vacancy and confirmed this as per the vacancy confirmation page [KICK-908]
  Then the User must be presented with the following page with information on next steps and their Kickstart ID
  And the <Kickstart ID> will be shown as "Your application ID: <Kickstart ID>"

  Examples:
  | <Kickstart ID>  | <Displayed Text>                |
  | KS23562834      | Your application ID: KS23562834 |
  | KS32455667      | Your application ID: KS32455667 |

Scenario: User is displayed with information on next steps
  Given that a User has added all of the roles for their vacancy and confirmed this as per the vacancy confirmation page [KICK-908]
  Then the User must be presented with the following page with information on next steps

# Sign Out
Scenario: User can sign out
  Given that a User is within the Applicant service
  When the User clicks the 'Sign out' Link
  Then the User must be signed out of the service [KICK-XXXX]
