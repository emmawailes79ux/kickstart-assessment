Feature: Add initial details to the vacancy

Description: Initial info about the vacancy needs to be provided to describe at a high level what type of job this is and how many vacancies are to be filled
  - Link to prototype: https://kickstart-assessment.herokuapp.com/employer/mvp/job-add
  - User could be either an Employer or a Gateway
  - Jira story: https://jira.service.dwpcloud.uk/browse/KICK-904

Flow:
  - Previous page is Add Vacancies [KICK-903]
  - Next page is Vacancy Advert [KICK-913]

# Job Title

@KICK-904
@KICK-110
Scenario: User enters a job title that is less than 100 characters and does not contain any special characters or integers
  Given that the User adds a job title that is less than 100 characters
  And does not contain any special characters or integers
  When the User clicks "Continue"
  Then the job title is valid

@KICK-904
@KICK-110
Scenario: User enters a job title that is more than 100 characters
  Given that the User that is more than 100 characters
  When the User clicks "Continue"
  Then the job title is invalid
  And an error summary heading is shown as "There is a problem"
  And an error summary list descriptive link is shown as "Please enter a job title smaller than 100 characters"

@KICK-904
@KICK-110
Scenario: User enters a job title that contains special characters or integers
  Given that the User that is more than 100 characters
  When the User clicks "Continue"
  Then the job title is invalid
  And an error summary heading is shown as "There is a problem"
  And an error summary list descriptive link is shown as "Please enter a job title that does not contain any special characters or numbers"

@KICK-904
@KICK-110
Scenario: User doesn't enter a job title
  Given that the User does not enter a job title
  When the User clicks "Continue"
  Then the job title is invalid
  And an error summary heading is shown as "There is a problem"
  And an error summary list descriptive link is shown as "Please enter a job title"

# Number of Vacancies

@KICK-904
@KICK-110
Scenario: User enters a valid number of vacancies in the "Number of Vacancies" field
  Given that the User enters a number of vacancies that is greater than or equal to 1
  And less than or equal to 9999
  And only contains integers
  And does not contain any special characters
  When the User clicks "Continue"
  Then the vacancy number is valid

@KICK-904
@KICK-110
Scenario: User does not enter a number of vacancies in the "Number of Vacancies" field
  Given that the User does not enter a number of vacancies
  When the User clicks "Continue"
  Then the vacancy number is not valid
  And an error summary heading is shown as "There is a problem"
  And an error summary list descriptive link is shown as "Please enter the number of vacancies for this role"

@KICK-904
@KICK-110
Scenario: User enters a number of vacancies that is "0" in the "Number of Vacancies" field
  Given that the User enters a number of vacancies that is "0"
  When the User clicks "Continue"
  Then the vacancy number is invalid
  And an error summary heading is shown as "There is a problem"
  And an error summary list descriptive link is shown as "You must have at least one vacancy for this role"

@KICK-904
@KICK-110
Scenario: User enters a number of vacancies that is greater than 9999 in the "Number of Vacancies" field
  Given that the User enters a number of vacancies that is greater than 9999
  When the User clicks "Continue"
  Then the vacancy number is invalid
  And an error summary heading is shown as "There is a problem"
  And an error summary list descriptive link is shown as "The number of vacancies cannot exceed 9999"

@KICK-904
@KICK-110
Scenario: User enters special characters or letters in the "Number of Vacancies" field
  Given that the User enters special characters or letters in the "Number of Vacancies" field
  When the User clicks "Continue"
  Then the vacancy number is invalid
  And an error summary heading is shown as "There is a problem"
  And an error summary list descriptive link is shown as "Please enter a valid number of vacancies for this role"

@KICK-904
Scenario: User enters a number greater than the total number of vacancies that the employer is allowed for this application
  Given that the User enters a number of vacancies that exceeds what was agreed in the initial application
  When the User clicks "Continue"
  Then the User must receive feedback requiring them to adjust their number stating: "The number of vacancies cannot exceed what was agreed in the initial application"

# Referral Limit

@KICK-904
@KICK-110
Scenario: User does not select whether they want a referral limit
  Given that the User is adding Role Details
  When a User has not selected whether they want to set a referral limit
  Then the vacancy number is invalid
  And an error summary heading is shown as "There is a problem"
  And an error summary list descriptive link is shown as "Please select whether you would like to set a referral limit"

@KICK-904
@KICK-110
Scenario: User selects "No" to whether they want to set a referral limit
  Given that the User is adding Role Details
  When a User has selected "No" on the referral limit question
  Then the referral limit is valid
  And the referral limit must be automatically set to 9999

@KICK-904
@KICK-110
Scenario: User selects "Yes" to whether they want to set a referral limit and the referral limit number field is displayed
  Given that the User is adding Role Details
  When a User has selected "Yes" on the referral limit question
  Then the referral limit form field must be displayed

@KICK-904
@KICK-110
Scenario: User has chosen "Yes" to set a referral limit but has not entered anything into the referral limit number field
  Given that the User has chosen "Yes" to set a referral limit but has not entered anything into the referral limit  number field
  When a User clicks "Continue"
  Then the referral limit number field is invalid
  And an error summary heading is shown as "There is a problem"
  And an error summary list descriptive link is shown as "Please enter a referral limit for this vacancy"

@KICK-904
@KICK-110
Scenario: User has chosen to set a referral limit by selecting "Yes" and has entered a valid referral limit in the referral limit number field
  Given that the User has chosen "Yes" to set a referral limit And has entered a value greater than or equal to 1
  And less than 9999
  And that is only an integer
  And that does not contain any special characters or letters
  When a User clicks "Continue"
  Then the referral limit is valid

@KICK-904
@KICK-110
Scenario: User has chosen to set a referral limit by selecting "Yes" but has entered "0" into the referral limit number field
  Given that the User has chosen "Yes" to set a referral limit
  But has entered "0" into the referral limit number field
  When a User clicks "Continue"
  Then the referral limit number field is invalid
  And an error summary heading is shown as "There is a problem"
  And an error summary list descriptive link is shown as "Your referral limit cannot be 0"

@KICK-904
@KICK-110
Scenario: User has chosen to set a referral limit by selecting "Yes" but has entered a value greater than 9999
  Given that the User has chosen to set a referral limit by selecting "Yes"
  And a User has entered a value greater than 9999
  Then the referral limit number field is invalid
  And an error summary heading is shown as "There is a problem"
  And an error summary list descriptive link is shown as "Your referral limit cannot be greater than 9999"

@KICK-904
@KICK-110
Scenario: User has chosen "Yes" to set a referral limit but has entered a value that contains special characters or a letter
  Given that the User has chosen to set a referral limit by selecting "Yes"
  And a User has entered a value that contains special characters or a letter
  When a User clicks "Continue"
  Then the referral limit number field is invalid
  And an error summary heading is shown as "There is a problem"
  And an error summary list descriptive link is shown as "Please enter a valid referral limit"

# Internal Job Reference

@KICK-904
@KICK-110
Scenario: User does not answer the internal job reference number question
  Given that the User does not answer the internal job reference number question
  When the User clicks "Continue"
  Then the User must receive feedback requiring them to answer the internal job reference number question "Please state whether you want to enter a job reference number"

@KICK-904
@KICK-110
Scenario: User chooses to provide an internal job reference number by selecting "Yes" and the job reference form field is displayed
  Given that the User chooses to provide an internal job reference number by selecting "Yes"
  When the User clicks "Continue"
  Then the User must receive feedback requiring them to Industry sector: "Please select a valid industry sector"

@KICK-904
@KICK-110
Scenario: User chooses not to provide an internal job reference number by selecting "No"
  Given that the User chooses not to provide an internal job reference number by selecting "No"
  When the User clicks "Continue"
  Then the internal job reference is valid

@KICK-904
@KICK-110
Scenario: User has chosen to set an internal job reference number by selecting "Yes" but has not entered anything into the employer job reference field
  Given that the User has chosen to set an internal job reference number by selecting "Yes" but has not entered anything into the employer job reference field
  When the User clicks "Continue"
  Then the job reference number field is invalid
  And an error summary heading is shown as "There is a problem"
  And an error summary list descriptive link is shown as "Please enter a job reference number"

@KICK-904
@KICK-110
Scenario: User has chosen to set an internal job reference number by selecting "Yes" but has entered more than 12 characters in the employer job reference
  Given that the User has chosen to set an internal job reference number by selecting "Yes" but has entered more than 12 characters into the employer job reference field
  When the User clicks "Continue"
  Then the job reference number field is invalid
  And an error summary heading is shown as "There is a problem"
  And an error summary list descriptive link is shown as "Please enter a job reference number"

# Industry sector

@KICK-904
@KICK-1109
Scenario: When the page first loads the 'Industry sector' drop-down field is set to 'Please select one'
  Given that the User is adding Role Details
  When the User has not selected the "Industry sector" drop-down
  Then the "Industry sector" drop-down must be set to "Please select one"

@KICK-904
@KICK-1109
Scenario: User doesn't choose a value within the 'Industry sector" form field
  Given that the User does not select a value within the "Industry Sector" form field
  When the User clicks "Continue"
  Then the User must receive feedback requiring them to Industry sector: "Please select a valid industry sector"

# Contact name

@KICK-904
@KICK-1109
Scenario: User enters a valid contact name that is less than 100 characters and does not contain any special characters or integers
  Given that the User adds a Contact Name that is less than 100 characters
  And does not contain any special characters or integers
  And is not a blank value
  And is an alphabetical string
  When the User clicks "Continue"
  Then the Contact Name is valid

@KICK-904
@KICK-1109
Scenario: User enters a Contact Name longer than 100 characters
  Given that the User adds a Contact Name that is longer than 100 characters
  When the User clicks "Continue"
  Then the Contact Name is invalid
  And an error summary heading is shown as "There is a problem"
  And an error summary list descriptive link is shown as "The contact name cannot exceed 100 characters"

@KICK-904
@KICK-1109
Scenario: User enters a Contact Name with special characters
  Given that the User adds a Contact Name that has special characters
  When the User clicks "Continue"
  Then the Contact Name is invalid
  And an error summary heading is shown as "There is a problem"
  And an error summary list descriptive link is shown as "The contact name cannot contain special characters"

@KICK-904
@KICK-1109
Scenario: User does not enter a contact name
  Given that the User does not enter a contact name
  When the User clicks "Continue"
  Then the Contact Name is invalid
  And an error summary heading is shown as "There is a problem"
  And an error summary list descriptive link is shown as "Please enter a contact name for this vacancy"

# Contact number

@KICK-904
@KICK-1109
Scenario: User enters a valid contact number that is less than 12 digits and more than 10 digits
  Given that the User adds a Contact Name that is less than 12 digits
  And more than 10 digits
  And all values are integers
  When the User clicks "Continue"
  Then the Contact Number is valid

@KICK-904
@KICK-1109
Scenario: User enters a Contact Number longer than 12 digits
  Given that the User adds a <Contact Name> that is longer than 12 characters
  When the User clicks "Continue"
  Then the Contact Number is invalid
  And an error summary heading is shown as "There is a problem"
  And an error summary list descriptive link is shown as "Contact numbers cannot be longer than 12 digits"

@KICK-904
@KICK-1109
Scenario: User enters a Contact Number smaller than 10 digits
  Given that the User adds a <Contact Name> that is less than 10 characters
  When the User clicks "Continue"
  Then the Contact Number is invalid
  And an error summary heading is shown as "There is a problem"
  And an error summary list descriptive link is shown as "Contact numbers cannot be smaller than 10 digits"

@KICK-904
@KICK-1109
Scenario: User enters a Contact Number with characters that are not integers
  Given that the User adds a Contact Name that has characters that are not integers
  When the User clicks "Continue"
  Then the Contact Name is invalid
  And an error summary heading is shown as "There is a problem"
  And an error summary list descriptive link is shown as "Please enter a valid contact number for this vacancy"

@KICK-904
@KICK-1109
Scenario: User enters a contact number that contains a 070, 09, 0843, 0844, 0845, 0870, 0871, 0872, 0873, 01, 02, 03, 030, or 0345 prefix
  Given that the User enters a contact number containing a 070, 09, 0843, 0844, 0845, 0870, 0871, 0872, 0873, 01, 02, 03, 030, or 0345 prefix
  When the user clicks 'Continue'
  Then the Contact Number is invalid
  And an error summary heading is shown as "There is a problem"
  And an error summary list descriptive link is shown as "Please enter a valid contact number for this vacancy"

@KICK-904
@KICK-1109
Scenario: User does not enter a contact number
  Given that the User does not enter a contact number
  When the User clicks "Continue"
  Then the Contact Number is invalid
  And an error summary heading is shown as "There is a problem"
  And an error summary list descriptive link is shown as "Please enter a contact number for this vacancy"

# Email address

@KICK-904
@KICK-1109
Scenario: User enters a valid email address
  Given that the User adds a valid email address that aligns to the syntax (name@example.com)
  And is shorter than 100 characters
  When the User clicks "Continue"
  Then the Contact Email Address is valid

@KICK-904
@KICK-1109
Scenario: User enters an invalid email address that deviates from the syntax
  Given that the User enters an email address that deviates from the syntax (name@example.com)
  When the User clicks "Continue"
  Then the email address is invalid
  And an error summary heading is shown as "There is a problem"
  And an error summary list descriptive link is shown as "Please enter a valid email address for this vacancy"

@KICK-904
@KICK-1109
Scenario: User enters an email address longer than 100 characters
  Given that the User enters an email address that is longer than 100 characters
  When the User clicks "Continue"
  Then the email address is invalid
  And an error summary heading is shown as "There is a problem"
  And an error summary list descriptive link is shown as "Please enter an email address shorter than 100 characters for this vacancy"

@KICK-904
@KICK-1109
Scenario: User enters an email address shorter than 10 characters
  Given that the User enters an email address that is shorter than 10 characters
  When the User clicks "Continue"
  Then the email address is invalid
  And an error summary heading is shown as "There is a problem"
  And an error summary list descriptive link is shown as "Please enter a valid email address for this vacancy"

@KICK-904
@KICK-1109
Scenario: User does not enter an email address
  Given that the User does not enter an email address
  When the User clicks "Continue"
  Then the email address is invalid
  And an error summary heading is shown as "There is a problem"
  And an error summary list descriptive link is shown as "Please enter an email address for this vacancy"
  
# Confirm Email Address 

Scenario: User enters a different email address in the Confirm Email Address field to what was entered in the Email Address field 
  Given that the User enters a different email address in the Confirm Email Address field to what was entered in the Email Address field 
  When the User clicks "Continue" 
  Then the email address is invalid 
  And an error summary heading is shown as "There is a problem" 
  And an error summary list descriptive link is shown as "The email addresses do not match" 

Scenario: User enters the same email address in the Confirm Email Address field as what was entered in the Email Address field 
  Given that the User enters the same email address in the Confirm Email Address field as what was entered in the Email Address field 
  And the email addresses are both valid 
  When the User clicks "Continue" 
  Then the Confirm Email Address field is valid 

Scenario: User enters an invalid email address that deviates from the syntax 
  Given that the User enters an email address that deviates from the syntax (name@example.com) 
  When the User clicks "Continue" 
  Then the email address is invalid 
  And an error summary heading is shown as "There is a problem" 
  And an error summary list descriptive link is shown as "Please enter a valid email address for this vacancy" 

Scenario: User enters an email address longer than 100 characters 
  Given that the User enters an email address that is longer than 100 characters 
  When the User clicks "Continue" 
  Then the email address is invalid 
  And an error summary heading is shown as "There is a problem" 
  And an error summary list descriptive link is shown as "Please enter an email address shorter than 100 characters for this vacancy" 

Scenario: User enters an email address shorter than 10 characters 
  Given that the User enters an email address that is shorter than 10 characters 
  When the User clicks "Continue" 
  Then the email address is invalid 
  And an error summary heading is shown as "There is a problem" 
  And an error summary list descriptive link is shown as "Please enter a valid email address for this vacancy" 

Scenario: User does not enter an email address 
  Given that the User does not enter an email address 
  When the User clicks "Continue" 
  Then the email address is invalid 
  And an error summary heading is shown as "There is a problem" 
  And an error summary list descriptive link is shown as "Please enter an email address for this vacancy" 

# Sign Out

@KICK-904
Scenario: User can sign out
  Given that a User is within the Applicant service
  When the User clicks the 'Sign out' Link
  Then the User must be signed out of the service [KICK-XXXX]
