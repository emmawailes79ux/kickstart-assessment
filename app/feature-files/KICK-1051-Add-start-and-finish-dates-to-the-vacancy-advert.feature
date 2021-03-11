Feature: Add start, closing, and listing dates to the vacancy

Description: Users can add the Anticipated Start Date, date to start advertising the vacancy, and closing date for the vacancy.
  - Link to prototype: https://kickstart-assessment.herokuapp.com/employer/mvp/job-add-1
  - Jira stories related to this feature: https://jira.service.dwpcloud.uk/browse/KICK-1051

Definitions:
  - Anticipated Start Date: The date that the vacancy is expected to start
  - Advertising Start Date: The date for the vacancy to start being advertised
  - Closing Date: The date that the vacancy is set to be closed

Flow:
  - Previous page is Vacancy Advert [KICK-913]
  - Next page is Where will this Job be based [KICK-905]

# Anticipated Start Date

Scenario: User sets the Anticipated Start Date to be as soon as possible
  Given that the User sets the Anticipated Start Date to "As soon as possible"
  When the User clicks the "Continue" button
  Then the Anticipated Start Date is valid

Scenario: User sets the Anticipated Start Date to be a date in the future
  Given that the User is setting the Anticipated Start Date
  When the User selects "A date in the future"
  Then the User must be presented with date fields for the Advertising Start Date in the DD/MM/YYYY format

Scenario: User does not answer the Anticipated Start Date question
  Given that the User has not selected an option for the Anticipated Start Date
  When the User clicks the "Continue" button
  Then they must receive feedback requiring them to complete the form fields: "Please provide an Anticipated Start Date for the vacancy"

Scenario: User has stated they want to set the Anticipated Start Date to a date in the future but leaves the date fields empty
  Given that the User has left the "When do you expect this vacancy to start?" field empty after selecting that they want a date in the future
  When the User clicks the "Continue" button
  Then the Anticipated Start Date is invalid
  And an error summary heading is shown as "There is a problem"
  And an error summary list descriptive link is shown as "Enter the anticipated start date as DD/MM/YYY"

Scenario Outline: User enters the Anticipated Start Date in a format that deviates from the (DD/MM/YYYY) syntax
  Given that the User has selected the <Anticipated Start Date> to be "a date in the future"
  And enters the <Anticipated Start Date> of their vacancy in a syntax that deviates from the DD/MM/YYYY format
  When the User clicks the "Continue" button
  Then the <Anticipated Start Date> will be invalid
  And an error summary heading is shown as "There is a problem"
  And an error summary list descriptive link is shown as "Enter the advertising start date as DD/MM/YYYY"

  Examples:
  | <Anticipated Start Date>  | <Displayed Text>                                                       |
  | 11/13/2020                | "Please enter a valid anticipated start date in the format DD/MM/YYYY" |
  | two/january/twenty-twenty | "Please enter a valid anticipated start date in the format DD/MM/YYYY" |

Scenario: User sets the Anticipated Start Date to be a date in the past
  Given that the User has set the Anticipated Start Date to a date in the past
  When the User clicks the "Continue" button
  Then the Anticipated Start Date will be invalid
  And an error summary heading is shown as "There is a problem"
  And an error summary list descriptive link is shown as "Set the Anticipated Start Date to at least one month in the future"

Scenario: User sets the Anticipated Start Date less than one month in the future
  Given that the User has set the Anticipated Start Date to a date less than one month in the future
  When the User clicks the "Continue" button
  Then the Anticipated Start Date will be invalid
  And an error summary heading is shown as "There is a problem"
  And an error summary list descriptive link is shown as "Set the Anticipated Start Date to at least one month in the future"

Scenario: User set the Anticipated Start Date over one month in the future
  Given that the User has set the Anticipated Start Date to a date over one month in the future
  When the User clicks the "Continue" button
  Then the Anticipated Start Date is valid

# Advertising Start Date

Scenario: User does not answer the Advertising Start Date question
  Given that the User has not selected an option for the Advertising Start Date
  When the User clicks the "Continue" button
  Then the Advertising Start Date will be invalid
  And an error summary heading is shown as "There is a problem"
  And an error summary list descriptive link is shown as "Select when you want the vacancy to be advertised"

Scenario: User sets the Advertising Start Date to be as soon as possible
  Given that the User is setting the Advertising Start Date to as soon as possible
  When the User clicks the "Continue" button
  Then the Anticipated Start Date is valid

Scenario: User sets the Advertising Start Date to be a date in the future
  Given that the User is setting the Advertising Start Date
  When the User selects "A date in the future"
  Then the User must be presented with date fields for the Advertising Start Date in the DD/MM/YYYY format

Scenario Outline: User enters the Advertising Start Date in a format that deviates from the (DD/MM/YYYY) syntax
  Given that the User has selected the <Advertising Start Date> to be "a date in the future"
  And enters the <Advertising Start Date> of their vacancy in a syntax that deviates from the DD/MM/YYYY format
  When the User clicks the "Continue" button
  Then the <Advertising Start Date> will be invalid
  And an error summary heading is shown as "There is a problem"
  And an error summary list descriptive link is shown as "Enter the advertising start date as DD/MM/YYYY"

  Examples:
  | <Advertising Start Date>  | <Displayed Text>                                                       |
  | 11/13/2020                | "Please enter a valid advertising start date in the format DD/MM/YYYY" |
  | two/january/twenty-twenty | "Please enter a valid advertising start date in the format DD/MM/YYYY" |


Scenario: User has stated they want to set the Advertising Start Date to a date in the future but leaves the date fields empty
  Given that the User has selected the Advertising Start Date to be "a date in the future"
  And does not enter a date value in the date fields
  When the User clicks the "Continue" button
  Then the Advertising Start Date will be invalid
  And an error summary heading is shown as "There is a problem"
  And an error summary list descriptive link is shown as "Enter an advertising start date in the future"

Scenario: User sets the Advertising Start Date to be a date in the past
  Given that the User has selected the Advertising Start Date to be "a date in the future"
  And enters a date value in the past
  When the User clicks the "Continue" button
  Then the Advertising Start Date will be invalid
  And an error summary heading is shown as "There is a problem"
  And an error summary list descriptive link is shown as "Set the advertising start date in the future"

Scenario: User sets the Advertising Start Date to be later than the Closing Date
  Given that the User has selected the Advertising Start Date to be later than the Closing Date
  When the User clicks the "Continue" button
  Then the Advertising Start Date will be invalid
  And an error summary heading is shown as "There is a problem"
  And an error summary list descriptive link is shown as "The advertising start date cannot be after the closing date"

Scenario: User sets the Advertising Start Date less than one month in the future
  Given that the User has set the Advertising Start Date to a date less than one month in the future
  When the User clicks the "Continue" button
  Then the Advertising Start Date will be invalid
  And an error summary heading is shown as "There is a problem"
  And an error summary list descriptive link is shown as "Set the Advertising Start Date to at least one month in the future"

Scenario: User set the Advertising Start Date to a date at least one month in the future
  Given that the User has set the Advertising Start Date to a date in the future
  And the date value is at least one month in the future
  When the User clicks the "Continue" button
  Then the Advertising Start Date is valid

#Closing Date

Scenario: User does not answer the Closing Date question
  Given that the User has not selected an option for the Closing Date
  When the User clicks the "Continue" button
  Then the Closing Date will be invalid
  And an error summary heading is shown as "There is a problem"
  And an error summary list descriptive link is shown as "Select yes if you want to set a closing date for applications"

Scenario: User chooses not to set a Closing Date 
  Given that the User is setting the Closing Date to 'No' 
  When the User clicks the "Continue" button 
  Then the Closing Date is valid 
  And the Closing Date must be automatically set to 12 weeks in the future 

Scenario: User wants to set a Closing Date
  Given that the User wants to set a Closing Date
  When the User selects "Yes"  to the closing date question
  Then the User must be presented with date fields for the Closing Date in the DD/MM/YYYY format

Scenario Outline: User enters the Closing Date in a format that deviates from the (DD/MM/YYYY) syntax
  Given that the User has selected the <Closing Date> to be "a date in the future"
  And enters the <Closing Date> of their vacancy in a syntax that deviates from the DD/MM/YYYY format
  When the User clicks the "Continue" button
  Then the <Closing Date> will be invalid
  And an error summary heading is shown as "There is a problem"
  And an error summary list descriptive link is shown as "Enter the closing date as DD/MM/YYYY"

  Examples:
  | <Closing Date>            | <Displayed Text>                                             |
  | 11/13/2020                | "Please enter a valid closing date in the format DD/MM/YYYY" |
  | two/january/twenty-twenty | "Please enter a valid closing date in the format DD/MM/YYYY" |

Scenario: User has stated they want to set a Closing Date for applications but leaves the date field empty
  Given that the User selects "Yes"  to the closing date question
  And has left the "Closing date for applications" field empty after selecting that they want to set a date
  When the User clicks the "Continue" button
  Then the Closing Date will be invalid
  And an error summary heading is shown as "There is a problem"
  And an error summary list descriptive link is shown as "Enter a closing date"

Scenario: User sets the Closing Date for applications to be a date in the past
  Given that the User selects "Yes"  to the closing date question
  And has set the closing date for applications to a date in the past
  When the User clicks the "Continue" button
  Then the Closing Date will be invalid
  And an error summary heading is shown as "There is a problem"
  And an error summary list descriptive link is shown as "Set the closing date to at least one month in the future"

Scenario: User sets the Closing Date to be earlier than the Advertising Start Date 
  Given that the User has selected the Closing Date to be earlier than the Advertising Start Date 
  When the User clicks the "Continue" button 
  Then the Closing Date will be invalid
  And an error summary heading is shown as "There is a problem" 
  And an error summary list descriptive link is shown as "The closing date cannot be before the advertising date" 

Scenario: User set the Closing Date for applications to a date at least one month in the future
  Given that the User selects "Yes"  to the closing date question
  And has set the Closing Date to a date at least one month in the future
  When the User clicks the "Continue" button
  Then the Closing Date for applications is valid

#Back

Scenario: User clicks the "Back" button
  Given that the User is entering the dates of their vacancy
  When the User clicks the "Back" link
  Then the User must be redirected back to the applicable Job Advert page [KICK-913]

#Continue

Scenario: User clicks "Continue" after filling in all the form fields correctly
  Given that the User is entering the dates of their vacancy
  When they have filled in the mandatory fields (and, where selected, the optional fields) properly and click ""Continue""
  Then they must be redirected to the page asking me where my job will be based

# Sign Out

Scenario: User can sign out
  Given that a User is within the Applicant service
  When the User clicks the 'Sign out' Link
  Then the User must be signed out of the service [KICK-XXXX]
