Feature: Add Single Location

Description: As an employer, I need to enter details about my vacancy's
location, so that I can reach the right claimants for a vacancy
- Link to prototype: https://kickstart-assessment.herokuapp.com/employer/mvp/job-add-3c
- Link to User Story: https://jira.service.dwpcloud.uk/browse/KICK-1053

Definitions:
- Employer: an employer applying for a kickstart scheme grant
- Vacancy: a vacancy that an employer is creating to surface to claimants
- Location: the location in which the vacancy will be advertised

Flow:
  - Previous page is if I require the employee to work from multiple locations [KICK-914]
  - Except when I have entered that the job involves A mix of remote and on-site work on the
    page asking me where the job will be based [KICK-905];
    Then I must be redirected to the page asking me how I want to advertise my vacancy and
    whether I require the employee to work from multiple locations [KICK-1052]

Scenarios

# Back

Scenario: User clicks on the back link
  Given that I am a User who is on the "Add Single Location" page
  When I click "Back"
  Then I must be redirected to the page asking me if I require the employee to work from multiple locations [KICK-914]
  But When I have entered that the job involves A mix of remote and on-site work on the page asking me where the job will be based [KICK-905]
  Then I must be redirected to the page asking me how I want to advertise my vacancy and whether I require the employee to work from multiple locations [KICK-1052]

# Building and Street

Scenario: User does not enter a Building and Street value
  Given that I am a User who does not enter a value in the Building or Street fields
  When I click "Continue"
  Then the Building and Street fields are invalid
  And an error summary heading is shown as "There is a problem"
  And an error summary list descriptive link is shown as "Please enter a Building and Street for this vacancy"

Scenario: User enters a value for the Building field that exceeds 100 characters
  Given that I am a User who enters a value that exceeds 100 characters in the Building field
  When I click "Continue"
  Then the Building and Street is invalid
  And an error summary heading is shown as "There is a problem"
  And an error summary list descriptive link is shown as "Enter a valid building and street for this vacancy"

Scenario Outline: User enters a value for the Building and Street field that contains special characters or any other non-alphanumeric values in the Building and Street fields
  Given that I am a User who enters a value that contains special characters or any other non-alphanumeric values for <Building and Street>
  When I click "Continue"
  Then the <Building and Street> is invalid
  And an error summary heading is shown as "There is a problem"
  And an error summary list descriptive link is shown as "Enter a valid building and street for this vacancy"

  Examples:
  | <Building and Street> | <Displayed Text>                                            |
  | Churchill Garden$     | "Please enter a valid Building and Street for this vacancy" |

# Town or City
Scenario: User does not enter a Town or City
  Given that I am a User who does not enter a value in the Town or City field
  When I click "Continue"
  Then the Town or City field is invalid
  And an error summary heading is shown as "There is a problem"
  And an error summary list descriptive link is shown as "Enter a town or city for this vacancy"

Scenario: User enters a value for the Town or City field that exceeds 100 characters
  Given that I am a User who enters a value that exceeds 100 characters in the Town or City field
  When I click "Continue"
  Then the Town or City is invalid
  And an error summary heading is shown as "There is a problem"
  And an error summary list descriptive link is shown as "Please enter a valid Town or City for this vacancy"

Scenario Outline: User enters a value for the Town or City field that contains special characters, integers, or any other non-alphabetical values
  Given that I am a User who enters a value that contains special characters, integers, or any other non-alphabetical values for <Town or City>
  When I click "Continue"
  Then the <Town or City> is invalid
  And an error summary heading is shown as "There is a problem"
  And an error summary list descriptive link is shown as "Please enter a valid Town or City for this vacancy"

  Examples:
  | <Town or City> | <Displayed Text>                                       |
  | Leed5          | "Please enter a valid Town or City for this vacancy"   |
  | Leed$          | "Please enter a valid Town or City for this vacancy"   |

# County
Scenario: User does not enter a County
  Given that I am a User who is on the "Add Single Location" page and do not enter a value in the County field
  When I click "Continue"
  Then the County is invalid
  And an error summary heading is shown as "There is a problem"
  And an error summary list descriptive link is shown as "Enter a county for this vacancy"

Scenario: User enters a value for the County field that exceeds 100 characters
  Given that I am a User who enters a value that exceeds 100 characters in the County field
  When I click "Continue"
  Then the County is invalid
  And an error summary heading is shown as "There is a problem"
  And an error summary list descriptive link is shown as "Enter a valid county for this vacancy"

Scenario Outline: User enters a value for the County field that contains special characters, integers, or any other non-alphabetical values
  Given that I am a User who enters a value that contains special characters, integers, or any other non-alphabetical values for <County>
  When I click "Continue"
  Then <County> is invalid
  And an error summary heading is shown as "There is a problem"
  And an error summary list descriptive link is shown as "Enter a valid county for this vacancy"

  Examples:
  | <County>               | <Displayed Text>                                 |
  | We$t Yorkshire         | "Please enter a valid County for this vacancy"   |
  | We5t Yorkshire         | "Please enter a valid County for this vacancy"   |

# Postcode

Scenario: User does not enter a postcode
  Given that I am a User who is on the "Add Single Location" page and do not enter a value in the Postcode field
  When I click "Continue"
  Then the Postcode is invalid
  And an error summary heading is shown as "There is a problem"
  And an error summary list descriptive link is shown as "Enter a postcode for this vacancy"

Scenario Outline: User enters special characters or other value that isn't an alphanumeric string in the Postcode field
  Given that I am a User who enters special characters or other value that isn't an alphanumeric string for <Postcode>
  When I click "Continue"
  Then <Postcode> is invalid
  And an error summary heading is shown as "There is a problem"
  And an error summary list descriptive link is shown as "Enter a valid postcode for this vacancy"

  Examples:
  | <Postcode>             | <Displayed Text>                                 |
  | LS2 9@W                | "Please enter a valid postcode for this vacancy" |
  | Southwest Leeds        | "Please enter a valid postcode for this vacancy" |

Scenario Outline: User enters a value that exceeds the 8 character maximum limit for the Postcode field
  Given that I am a User who enters a value that exceeds the character limit for the Postcode field
  When I click "Continue"
  Then the Postcode is invalid
  And an error summary heading is shown as "There is a problem"
  And an error summary list descriptive link is shown as "Enter a valid postcode for this vacancy"

  Examples:
  | <Postcode>             | <Displayed Text>                                 |
  | LS12 19PW              | "Please enter a valid postcode for this vacancy" |

Scenario Outline: User enters a value that falls below the 6 character minimum limit for the Postcode field
  Given that I am a User who enters a value that exceeds the character limit for the Postcode field
  When I click "Continue"
  Then the Postcode is invalid
  And an error summary heading is shown as "There is a problem"
  And an error summary list descriptive link is shown as "Enter a valid postcode for this vacancy"

  Examples:
  | <Postcode>             | <Displayed Text>                                 |
  | LS2                    | "Please enter a valid postcode for this vacancy" |

Scenario Outline: User enters an invalid postcode value for the Postcode field
  Given that I am a User who enters a value that does not match the UK postcode format
  When I click "Continue"
  Then the Postcode is invalid
  And an error summary heading is shown as "There is a problem"
  And an error summary list descriptive link is shown as "Enter a valid postcode for this vacancy"

  Examples:
  | <Postcode>             | <Displayed Text>                                 |
  | WC2H 7LTa              | "Please enter a valid postcode for this vacancy" |


#Public Transport 

Scenario: User selects "Yes" on whether public transport is available 
  Given that I am User who selects "Yes" on the is public transport available question 
  When I click "Continue" 
  Then the "Is the location accessible via public transport" field is valid 

Scenario: User selects "No" on whether public transport is available 
  Given that I am User who selects "No" on the is public transport available question 
  When I click "Continue" 
  Then the "Is the location accessible via public transport" field is valid 

Scenario: User selects "Do not know" on whether public transport is available 
  Given that I am User who selects "Do not know" on the is public transport available question 
  When I click "Continue" 
  Then the "Is the location accessible via public transport" field is valid 


# Continue

Scenario: User clicks "Continue" after filling out all the form fields properly
  Given that I am a User providing details about my vacancy's location
  And have filled out all the form fields properly,
  When I click the 'Continue' button,
  Then I must be redirected to the page summarising my vacancy entry [KICK-907]

# Sign Out

Scenario: User can sign out
  Given that a User is within the Applicant service
  When the User clicks the 'Sign out' Link
  Then the User must be signed out of the service [KICK-XXXX]
