Feature: Add start, closing, and listing dates to the vacancy

Description: Users can add the Anticipated Start Date, date to start advertising the vacancy, and closing date for the vacancy.
  - Link to prototype: https://kickstart-assessment.herokuapp.com/employer/mvp/job-add-1
  - Jira stories related to this feature: https://jira.service.dwpcloud.uk/browse/KICK-1051

Definitions:
  - Anticipated Start Date (explain what this is)
  - Advertising Start Date (explain what this is)
  - Closing Date (explain what this is)

Scenario: User sets the Anticipated Start Date to be as soon as possible
  Given that the User sets the Anticipated Start Date to "As soon as possible"
  When the User clicks the "Continue" button
  Then the Anticipated Start Date is valid

Scenario: User sets the Anticipated Start Date to be a date in the future
  Given that the User is setting the Anticipated Start Date
  When the User selects "A date in the future"
  Then a date fields for "When do you expect this vacancy to start?" is shown

Scenario: User does not answer the Anticipated Start Date question
  Given that the User has not selected an option for the Anticipated Start Date
  When the User clicks the "Continue" button
  Then they must receive feedback requiring them to complete the form fields: "Please select when you need the Anticipated Start Date to start"

Scenario: User enters the Anticipated Start Date in a format that deviates from the (DD/MM/YYYY) syntax
  Given that the User is enters the Anticipated Start Date of their vacancy in a syntax that deviates from the DD/MM/YYYY format
  When the User clicks the "Continue" button
  Then the Anticipated Start Date is invalid
  And an error summary heading is shown as "There is a problem"
  And an error summary list descriptive link is shown as "Please enter a valid Anticipated Start Date in the format DD/MM/YYY"

Scenario: User has stated they want to set the Anticipated Start Date to a date in the future but leaves the date fields empty
  Given that the User has left the "When do you expect this vacancy to start?" field empty after selecting that they want a date in the future
  When the User clicks the "Continue" button
  Then the Anticipated Start Date will be invalid
  And an error summary heading is shown as "There is a problem"
  And an error summary list descriptive link is shown as "Please enter a future Anticipated Start Date"

Scenario: User sets the Anticipated Start Date to be a date in the past
  Given that the User has set the Anticipated Start Date to a date in the past
  When the User clicks the "Continue" button
  Then the Anticipated Start Date will be invalid
  And an error summary heading is shown as "There is a problem"
  And an error summary list descriptive link is shown as "Please set the Anticipated Start Date to at least one month in the future"

Scenario: User sets the Anticipated Start Date less than one month in the future
  Given that the User has set the Anticipated Start Date to a date in the past
  When the User clicks the "Continue" button
  Then the Anticipated Start Date will be invalid
  And an error summary heading is shown as "There is a problem"
  And an error summary list descriptive link is shown as "Please set the Anticipated Start Date to at least one month in the future"

Scenario: User set the Anticipated Start Date over one month in the future
  Given that the User has set the Anticipated Start Date to a date over one month in the future
  When the User clicks the "Continue" button
  Then the Anticipated Start Date is valid

Scenario: User sets the Advertising Start Date to be as soon as possible
  Given that the User is setting the Advertising Start Date to as soon as possible
  When the User clicks the "Continue" button
  Then the Anticipated Start Date is valid

Scenario: User sets the Advertising Start Date to be a date in the future
  Given that the User is setting the Advertising Start Date
  When the User selects "A date in the future"
  Then the Advertising Start Date will be invalid
  And an error summary heading is shown as "There is a problem"
  And an error summary list descriptive link is shown as "What date do you want the vacancy advert to go live?"

Scenario: User does not answer the Advertising Start Date question
  Given that the User has not selected an option for the Advertising Start Date
  When the User clicks the "Continue" button
  Then the Advertising Start Date will be invalid
  And an error summary heading is shown as "There is a problem"
  And an error summary list descriptive link is shown as "Please select when you want the vacancy to be advertised"

Scenario: User enters the Advertising Start Date in a format that deviates from the (DD/MM/YYYY) syntax
  Given that the User has selected the Advertising Start Date to be "a date in the future"
  And enters the Advertising Start Date of their vacancy in a syntax that deviates from the DD/MM/YYYY format
  When the User clicks the "Continue" button
  Then the Advertising Start Date will be invalid
  And an error summary heading is shown as "There is a problem"
  And an error summary list descriptive link is shown as "Please enter a valid advertising start date in the format DD/MM/YYYY"

Scenario: User has stated they want to set the Advertising Start Date to a date in the future but leaves the date fields empty
  Given that the User has selected the Advertising Start Date to be "a date in the future"
  And does not enter a date value in the date fields
  When the User clicks the "Continue" button
  Then the Advertising Start Date will be invalid
  And an error summary heading is shown as "There is a problem"
  And an error summary list descriptive link is shown as "Please enter a future advertising start date"

Scenario: User sets the Advertising Start Date to be a date in the past
  Given that the User has selected the Advertising Start Date to be "a date in the future"
  And enters a date value in the past
  When the User clicks the "Continue" button
  Then the Advertising Start Date will be invalid
  And an error summary heading is shown as "There is a problem"
  And an error summary list descriptive link is shown as "Please set the advertising start date to a date in the future"

Scenario: User set the Advertising Start Date to a date in the future
  Given that the User has set the Advertising Start Date to a date in the future
  And the date value is at least one month in the future
  When the User clicks the "Continue" button
  Then the Advertising Start Date is valid

Scenario: User does not answer the Closing Date question
  Given that the User has not selected an option for the Closing Date
  When the User clicks the "Continue" button
  Then the Closing Date will be invalid
  And an error summary heading is shown as "There is a problem"
  And an error summary list descriptive link is shown as "Please select if you want to set a closing date for applications"

Scenario: User chooses not to set a Closing Date
  Given that the User is setting the Closing Date to 'No'
  When the User clicks the "Continue" button
  Then the Closing Date is valid

Scenario: User wants to set a Closing Date
  Given that the User wants to set a Closing Date
  When the User selects "Yes"  to the closing date question
  Then a date field control for "Closing date for applications" is shown

Scenario: User enters the Closing Date for applications in a format that deviates from the (DD/MM/YYYY) syntax
  Given that the User selects "Yes"  to the closing date question
  And enters the Closing Date for applications in a syntax that deviates from the DD/MM/YYYY format
  When the User clicks the "Continue" button
  Then the Closing Date will be invalid
  And an error summary heading is shown as "There is a problem"
  And an error summary list descriptive link is shown as "Please enter a valid closing date in the format DD/MM/YYYY"

Scenario: User has stated they want to set a closing date for applications but leaves the date field empty
  Given that the User selects "Yes"  to the closing date question
  And has left the "Closing date for applications" field empty after selecting that they want to set a date
  When the User clicks the "Continue" button
  Then the Closing Date will be invalid
  And an error summary heading is shown as "There is a problem"
  And an error summary list descriptive link is shown as "Please enter a closing date for applications"

Scenario: User sets the closing date for applications to be a date in the past
  Given that the User selects "Yes"  to the closing date question
  And has set the closing date for applications to a date in the past
  When the User clicks the "Continue" button
  Then the Closing Date will be invalid
  And an error summary heading is shown as "There is a problem"
  And an error summary list descriptive link is shown as "Please set the closing date for applications to a date at least one month in the future"

Scenario: User set the Closing Date for applications to a date at least one month in the future
  Given that the User selects "Yes"  to the closing date question
  And has set the Closing Date to a date at least one month in the future
  When the User clicks the "Continue" button
  Then the Closing Date for applications is valid

Scenario: User clicks the "Back" button
  Given that the User is entering the dates of their vacancy
  When the User clicks the "Back" link
  Then the User must be redirected back to the applicable Job Advert page

Scenario: User clicks "Continue" after filling in all the form fields correctly
  Given that the User is entering the dates of their vacancy
  When they have filled in the mandatory fields (and, where selected, the optional fields) properly and click ""Continue""
  Then they must be redirected to the page asking me where my job will be based
