Feature: Where will this vacancy be based?

Description: As an employer, I need to clarify where my vacancies will be based on the Applicant Service,
so that I can reach the right claimants for particular jobs
- Link to prototype: https://kickstart-assessment.herokuapp.com/User/mvp/job-add-4
- Link to User Story: https://jira.service.dwpcloud.uk/browse/KICK-903

Flow:
  - Previous page is Vacancy Start and Finish Dates [KICK-1051]
  - If the user selects the job will require work on-site at all times,
    then the next page is Multiple Location [KICK-914]
  - If the user selects the job will require working remotely at all times,
    Then the user is routed through to the Hours and Pay page [KICK-906]
  - If the user selects the job will require a mix of remote and on-site work,
    then the next page is Advertise Locally + Multiple Locations [KICK-905]

Definitions:
- Employer: an employer applying for a kickstart scheme grant
- Vacancy: a vacancy that an employer is creating to surface to claimants
- Location: the location in which the vacancy will be advertised

Scenarios

Scenario: User does not select where this job will be based
Given that the User does not select where this job will be based
When the user clicks the Continue button
Then the form is not valid
And an error summary heading is shown as "There is a problem"
And an error summary list descriptive link is shown as "Please select an option"


Scenario: User selects that the job requires the employee to work on site at all times
Given that the User selects the option "Required to work on-site at all times"
When the user clicks the Continue button
Then the form is valid
And the user is routed through to the Multiple Location question page [KICK-914]


Scenario: User selects that the job will require a mix of on-site and remote work
Given that the User selects the option "A mix of remote and on-site work"
When the user clicks the Continue button
Then the form is valid
And the user is routed through to the Advertise locally + Multiple Location question page [KICK-1052]


Scenario: User selects that the job requires the employee to work from home or remotely at all times
Given that the User selects the option "Working remotely/at home at all times"
When the user clicks the Continue button
Then the form is valid
And the user is routed through to the Hours and Pay page [KICK-906]


Scenario: User clicks on the back link
Given that the User on the remote working question page
When the User clicks the "Back" link
Then the User must be redirected back to the Dates page [KICK-1051]

# Sign Out

Scenario: User can sign out
  Given that a User is within the Applicant service
  When the User clicks the 'Sign out' Link
  Then the User must be signed out of the service [KICK-XXXX]
