Feature: Add your vacancies

Description: As an employer, I need to be able to view a list of my vacancies and roles on the Applicant Service, so that I can be sure I am adding the right roles
  - Link to prototype: https://kickstart-assessment.herokuapp.com/employer/mvp/job-list-empty
  - User could be either an Employer or a Gateway
  - Jira story: https://jira.service.dwpcloud.uk/browse/KICK-903

Definitions:
  - Vacancy Service: The DWP service for managing vacancies
  - Kickstart ID:
  - Number of Approved Vacancies:

Flow:
  - This is the start page for the add vacancies flow
  - Next page is Vacancy Details

Scenario Outline: User can see Kickstart ID on the page where the data is available from the Vacancy Service
  Given that the User has navigated to the Add your vacancies page
  And the <Kickstart ID> is available from the Vacancy Service
  When the page loads
  Then the <Kickstart ID> will be shown as "Application ID: <Kickstart ID>"

Examples:

| <Kickstart ID>  | <Displayed Text>           |
| KS23562834      | Application no: KS23562834 |
| KS32455667      | Application no: KS32455667 |

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
  The something happens ...

Scenario: The Number of Approved Vacancies is unavailable from the Vacancy Service
  Given the user has navigated to the Add your vacancies page
  And the Number of Approved Vacancies is unavailable from the Vacancy service
  When the page loads
  The something happens ...

Scenario: User chooses to add a vacancy
  Given that the User is on the Add your vacancies page
  And they can see an "Add Vacancy" button
  When they click the "Add Vacancy" button
  Then they will be taken to the Vacancy Details page

Scenario: User can see vacancies that they have added
  Given that the User is on the Add Your Vacancies page
  When Vacancies are available in the Vacancy Service
  Then they must be able to view the added vacancies within a table containing the columns: "Job Title," "Number of Vacancies," "Start Date," "Location," and "Postcode"
  And they receive confirmation of the added vacancy as per the vacancy confirmation page
