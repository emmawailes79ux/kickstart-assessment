Feature: Add Hours and Pay

Description: As an employer, I need to provide details about a vacancy's pay
and hours on the Applicant Service, so that I can reach suitable claimants
- Link to prototype: https://kickstart-assessment.herokuapp.com/User/mvp/job-add-4
- Link to User Story: https://jira.service.dwpcloud.uk/browse/KICK-903

Definitions:
- User: an employer applying for a kickstart scheme grant
- Vacancy: a vacancy that an employer is creating to surface to claimants
- Location: the location in which the vacancy will be advertised

Flow:
  - Previous page is Add Single Location [KICK-1053] if I have chosen to add a single location
  - Previous page is Add Multiple Locations [KICK-1071] if I have chosen to add multiple locations
  - Next page is Vacancy Summary [KICK-907]

Scenarios

# Back

Scenario: User clicks on the back link
  Given that I am a User who is on the "Add hours and pay" page
  When I click "Back"
  Then I must be redirected to the page requiring me to enter a vacancy's location [KICK-1053]
  But When I have entered multiple locations
  Then I must be redirected to the page requiring me to enter multiple locations [KICK-1071]

# Total Hours Per Week

Scenario: User enters a value smaller than 25 hours in the "Total Hours Per Week" field
  Given that I am a User who enters a value smaller than 25 within the "Total Hours Per Week" field
  When I click "Continue"
  Then the "Total Hours Per Week" field is invalid
  And an error summary heading is shown as "There is a problem"
  And an error summary list descriptive link is shown as "The total number of hours per week cannot be less than 25"

Scenario: User enters a value that is not an integer in the "Total Hours Per Week" field
  Given that I am a User who enters a value that is not an integer within the "Total Hours Per Week" field
  When I click "Continue",
  Then the "Total Hours Per Week" field is invalid
  And an error summary heading is shown as "There is a problem"
  And an error summary list descriptive link is shown as "Enter a valid number of hours per week"

Scenario: User does not enter a value in the "Total Hours Per Week" field
  Given that I am a User who does not enter a value within the "Total Hours Per Week" field
  When I click "Continue"
  Then the "Total Hours Per Week" field is invalid
  And an error summary heading is shown as "There is a problem"
  And an error summary list descriptive link is shown as "Enter the number of hours per week for this vacancy"

Scenario: User enters "0" within the "Total Hours Per Week" field
  Given that I am a User who enters the "0" value within the "Total Hours Per Week" field
  When I click "Continue"
  Then the "Total Hours Per Week" field is invalid
  And an error summary heading is shown as "There is a problem"
  And an error summary list descriptive link is shown as "The total hours per week for this vacancy cannot be 0"

Scenario: User enters a value greater than 5 characters within the "Total Hours Per Week" field
  Given that I am a User who enters a value greater than 5 characters within the "Total Hours Per Week" field
  And the value is an Integer
  When I click "Continue"
  Then the "Total Hours Per Week" field is invalid
  And an error summary heading is shown as "There is a problem"
  And an error summary list descriptive link is shown as "The total number of hours per week must be fewer than 5 characters"

Scenario Outline: User enters special characters or letters within the "Total Hours Per Week" field
  Given that I am a User who enters special characters or letters within the <Total Hours Per Week> field
  When I click "Continue"
  Then the <Total Hours Per Week> field is invalid
  And an error summary heading is shown as "There is a problem"
  And an error summary list descriptive link is shown as "Please enter a valid number of hours per week"

  Examples:
  | <Total Hours Per Week> | <Displayed Text>                                                 |
  | 2$                     | "Please enter a valid number of hours per week for this vacancy" |
  | twenty                 | "Please enter a valid number of hours per week for this vacancy" |

Scenario: User enters a valid number of hours within the "Total Hours Per Week" field
  Given that I am a User who enters a value within the "Total Hours Per Week" field that is an integer
  And does not contain any special characters or letters
  And is under 5 characters long
  And is not "0"
  When I click "Continue"
  Then the Total Hours Per Week field is valid

# Working Pattern

Scenario: User selects "Fixed pattern of days" for Days
  Given that I am a User who selects the "Fixed Pattern of Days" radio
  Then checkboxes for the days must be displayed

Scenario: User selects the "Flexible" radio for Days
  Given that I am a User who selects the "Flexible" radio for Days
  When I click "Continue"
  Then the "Flexible" value is valid

Scenario: User does not select an option for Days
  Given that I am a User who does not select an option for Days
  When I click "Continue"
  Then the "Days" field is invalid
  And an error summary heading is shown as "There is a problem"
  And an error summary list descriptive link is shown as "Select whether the working days are flexible or fixed"

Scenario: User does not select days within the "Fixed pattern of days" field
  Given that I am a User who has selected the "Fixed pattern of days" radio and have not selected a day
  When I click "Continue"
  Then the "Fixed Pattern of Days" radio is invalid
  And an error summary heading is shown as "There is a problem"
  And an error summary list descriptive link is shown as "Enter the fixed pattern of days"

# Hours

Scenario: User does not select an option for hours
  Given that I am a User who does not select any option for hours
  When I click "Continue"
  Then the hours field is invalid
  And an error summary heading is shown as "There is a problem"
  And an error summary list descriptive link is shown as "Select whether the working hours are flexible or fixed daily hours"

Scenario: User selects the "Flexible" radio
  Given that I am a User who selects the "Flexible" radio for hours
  When I click "Continue"
  Then the "Flexible" radio is valid

Scenario: User selects the "Fixed daily hours" radio
  Given that I am a User who selects the "Fixed daily hours" radio
  Then the form fields for entering hours: "From" and "To" must be shown

Scenario: User chooses fixed daily hours but does not enter any values
  Given that I am a User who selects the "Fixed daily hours" radio
  But I do not enter any values
  When I click "Continue"
  Then the "From" field is invalid
  And the "To" field is invalid
  And an error summary heading is shown as "There is a problem"
  And an error summary list descriptive link is shown as "Enter the fixed daily hours for this vacancy"

Scenario: User enters fixed daily hours and the hours "from" exceed the hours "to"
  Given that I am a User who selects the "Fixed daily hours" radio and the value for the "from" field is greater than that for the "to" field
  When I click "Continue"
  Then the "From" field is invalid
  And the "To" field is invalid
  And an error summary heading is shown as "There is a problem"
  And an error summary list descriptive link is shown as "The start time cannot be later than the finishing time"

Scenario: User enters fixed daily hours and the hours "to" are smaller than the hours "from"
  Given that I am a User who selects the "Fixed daily hours" radio and the value for the "from" field is greater than that for the "to" field
  When I click "Continue"
  Then the "From" field is invalid
  And the "To" field is invalid
  And an error summary heading is shown as "There is a problem"
  And an error summary list descriptive link is shown as "The start time cannot be later than the finishing time"

Scenario: User enters a value greater than 5 characters within the "From" or "To" field
  Given that I am a User who enters a value greater than 5 characters within the "From" or "To" field
  And the value is an Integer
  When I click "Continue"
  Then the "From" field is invalid
  And the "To" field is invalid
  And an error summary heading is shown as "There is a problem"
  And an error summary list descriptive link is shown as "Hours must be fewer than 5 characters"

Scenario Outline: User enters values that are not integers for the fixed daily hours
  Given that I am a User who selects the "Fixed daily hours" radio and enter a value that is a special character, letter or not an integer within the <From> or <To> fields
  When I click "Continue"
  Then the "From" field is invalid
  And the "To" field is invalid
  And an error summary heading is shown as "There is a problem"
  And an error summary list descriptive link is shown as "Enter the fixed daily hours as numbers, like 9"

  Examples:
  | <From> | <To> | <Displayed Text>                                       |
  | twelve | six | "Please enter valid fixed daily hours for this vacancy" |
  | 2$     | 18@ | "Please enter valid fixed daily hours for this vacancy" |

# Pay

Scenario: User does not select any option under "Pay"
  Given that I am a User who selects the "National Minimum Wage" radio
  When I click "Continue"
  Then the "Pay" field is invalid
  And an error summary heading is shown as "There is a problem"
  And an error summary list descriptive link is shown as "Select a payment type"

Scenario: User selects the "National Minimum Wage" radio
  Given that I am a User who selects the "National Minimum Wage" radio
  When I click "Continue"
  Then the "National Minimum Wage" radio is valid

Scenario: User selects the "Hourly Pay" radio
  Given that I am a User who selects the "Hourly Pay" radio
  Then I must be shown the form field for entering "Hourly Pay"

Scenario: User enters a value lower than the National Minimum Wage in the "Hourly Pay" field
  Given that I am a User who enters a value lower than the national minimum wage in the "Hourly Pay" field
  When I click "Continue"
  Then the "Hourly Pay" field is invalid
  And an error summary heading is shown as "There is a problem"
  And an error summary list descriptive link is shown as "The hourly pay for this vacancy cannot fall below the national minimum wage"

Scenario: User does not enter a value in the "Hourly Pay" field
  Given that I am a User who does not enter a value in the "Hourly Pay" field
  When I click "Continue"
  Then the "Hourly Pay" field is invalid
  And an error summary heading is shown as "There is a problem"
  And an error summary list descriptive link is shown as "Enter the hourly pay for this vacancy"

Scenario Outline: User enters an invalid character in the "Hourly Pay" field
  Given that I am a User who does enters a letter, special character, or value that is not an integer in the <Hourly Pay> field
  When I click "Continue"
  Then the "Hourly Pay" field is invalid
  And an error summary heading is shown as "There is a problem"
  And an error summary list descriptive link is shown as "Enter the hourly pay as a number, like 7"

  Examples:
  | <Hourly Pay>           | <Displayed Text>                                                 |
  | 2$                     | "Please enter a valid number of hours per week for this vacancy" |
  | twenty pounds          | "Please enter a valid number of hours per week for this vacancy" |

# Continue

Scenario: User clicks "Continue" after filling out all the form fields properly
  Given that I am a User providing details about my vacancy's hours and pay
  And have filled out all the form fields properly
  When I click the 'Continue' buttons
  Then I must be redirected to the page summarising my vacancy entry [KICK-907]

# Sign Out

Scenario: User can sign out
  Given that a User is within the Applicant service
  When the User clicks the 'Sign out' Link
  Then the User must be signed out of the service [KICK-XXXX]
