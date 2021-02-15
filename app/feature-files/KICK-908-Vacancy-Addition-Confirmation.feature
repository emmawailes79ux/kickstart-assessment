Feature: Vacancy Addition Confirmation

Description: As an employer, I need confirmation that I have successfully added a vacancy, so that I can be sure I have added a vacancy
  - Link to prototype: https://kickstart-assessment.herokuapp.com/employer/mvp/job-list-role-added
  - User could be either an Employer or a Gateway
  - Jira story: https://jira.service.dwpcloud.uk/browse/KICK-908

Definitions:
  - Vacancy Service: The DWP service for managing vacancies
  - Kickstart ID: The employer's application ID that identifies their application
  - Number of Approved Vacancies: The number of vacancies that have been approved as part of an employer's initial application

Flow:
  - This is the confirmation page for the add vacancies flow
  - Next page is Vacancy Details [KICK-904], if there are more vacancies to add
  - Next page is What Happens Next [KICK-1072], if all vacancies have been added and the 'Submit Vacancies' button has been clicked

Scenarios:

Scenario Outline: User can see Kickstart ID on the page where the data is available from the Vacancy Service
  Given that the User has navigated to the Add your vacancies page
  And the <Kickstart ID> is available from the Vacancy Service
  When the page loads
  Then the <Kickstart ID> will be shown as "Application ID: <Kickstart ID>"

  Examples:
  | <Kickstart ID>  | <Displayed Text>           |
  | KS23562834      | Application ID: KS23562834 |
  | KS32455667      | Application ID: KS32455667 |

Scenario Outline: User can see the number of Vacancies they have applied for where the data is available from the Vacancy Service
  Given that the User has navigated to the Add your vacancies page
  And the <Number of Approved Vacancies> is available from the Vacancy Service
  When the page loads
  Then the <Number of Approved Vacancies> for a given application is shown as <Displayed Text>

  Examples:
  | <Number of Approved Vacancies>  | <Displayed Text>                               |
  | 34                              | Provide details for the 34 Kickstart vacancies |
  | 26                              | Provide details for the 26 Kickstart vacancies |

Scenario: The Kickstart ID is unavailable from the Vacancy Service
  Given the user has navigated to the Add your vacancies page
  And the Kickstart ID is unavailable from the Vacancy service
  When the page loads
  Then a user must be routed to the service error page [KICK-XXXX]

Scenario: The Number of Approved Vacancies is unavailable from the Vacancy Service
  Given the user has navigated to the Add your vacancies page
  And the Number of Approved Vacancies is unavailable from the Vacancy service
  When the page loads
  Then a user must be routed to the service error page [KICK-XXXX]

Scenario: User chooses to add a vacancy
  Given that the User is on the Add your vacancies page
  And they can see an "Add Vacancy" button
  When they click the "Add Vacancy" button
  Then they will be taken to the Add Initial Details to the Vacancy page [KICK-904]

Scenario Outline: User can see vacancies that they have added
  Given that the User is on the Add Your Vacancies page
  When Vacancies are available in the Vacancy Service
  Then they must be able to view the added vacancies within a table containing the columns: "Job Title," "Number of Vacancies," "Start Date," "Location," and "Postcode"
  And they receive confirmation of the added vacancy via the following banner message: "<Role Title> added successfully"

  Examples:
  | <Role Title>                    | <Displayed Text>                     |
  | Junior Designer                 | 'Junior Designer' added successfully |
  | Shop Assistant                  | 'Shop Assistant' added successfully  |

Scenario Outline: User can confirm vacancies
  Given that the User is on the Add Your Vacancies page
  When the User has added all the vacancies allocated to them in the initial Application
  And the User clicks the "Submit Vacancies" button
  Then they must be redirected to the page outlining what happens next [KICK-1072]

# Sign Out

Scenario: User can sign out
  Given that a User is within the Applicant service
  When the User clicks the 'Sign out' Link
  Then the User must be signed out of the service [KICK-XXXX]
