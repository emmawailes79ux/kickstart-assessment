Feature: Login to the Applicant Service

Description: As an employer I need to be able to enter my email address and my application ID, so that I can confirm that I am who I say I am
  - Link to prototype: https://kickstart-assessment.herokuapp.com/employer/mvp/sign-in
  - Jira story: https://jira.service.dwpcloud.uk/browse/KICK-1046

Definitions:
  - initial application: the initial application that the user makes to apply for a kickstart scheme grant

Flow:
  - This is the start page for the authentication flow, following on from the success email [KICK-895]
  - Next page is the page to enter the security code [KICK-1048]
  - A successful match on this page also has to trigger an email to generate a security code [KICK-1047]

#Email address

Scenario: User enters a valid email address
  Given that the User adds a valid email address that aligns to the syntax (name@example.com)
  And is shorter than 100 characters
  When the User clicks "Continue"
  Then the Contact Email Address is valid

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
  And an error summary list descriptive link is shown as "Please enter an email address shorter than 100 characters"

Scenario: User enters an email address shorter than 10 characters
  Given that the User enters an email address that is shorter than 10 characters
  When the User clicks "Continue"
  Then the email address is invalid
  And an error summary heading is shown as "There is a problem"
  And an error summary list descriptive link is shown as "Please enter a valid email address"

Scenario: User does not enter an email address
  Given that the User does not enter an email address
  When the User clicks "Continue"
  Then the email address is invalid
  And an error summary heading is shown as "There is a problem"
  And an error summary list descriptive link is shown as "Please enter an email address"

Scenario: Email does not match what is recorded in the initial application
  Given that the user has entered a valid email address
  But the email address does not match what was provided in the initial application
  When the User clicks "Continue"
  Then the email address is invalid
  And an error summary heading is shown as "There is a problem"
  And an error summary list descriptive link is shown as "Please enter a valid email address"

#Kickstart application number

Scenario Outline: User enters an invalid Kickstart application number
  Given that the User has entered their Kickstart application number in an <Invalid Format>
  When the user clicks 'Continue'
  Then the Kickstart ID is invalid
  And an error summary heading is shown: "There is a problem"
  And an error summary list descriptive link is shown as "Please enter a valid Kickstart application number"

  Examples:
  | <Invalid Format>  | <Displayed Text>                                    |
  | KS235628          | "Please enter a valid Kickstart application number" |
  | KS3245566712      | "Please enter a valid Kickstart application number" |
  | K$23562842        | "Please enter a valid Kickstart application number" |

Scenario Outline: User enters a valid Kickstart application number
  Given that the User has entered their Kickstart application number in an <Valid Format>
  And it is exactly 10 characters long
  And it does not contain any special characters
  When the user clicks 'Continue'
  Then the Kickstart ID is valid
  And the user must be redirected to the page to enter the security code [KICK-1048]
  And an email with a generated security code must be sent to the user's email

  Examples:
  | <Valid Format>  | <Validity> |
  | KS23562824      | Valid      |

Scenario: Kickstart application number does not match what is recorded in the initial application
  Given that the user has entered a valid Kickstart application number
  But the Kickstart application number does not match what was provided in the initial application
  When the User clicks "Continue"
  Then the Kickstart application number is invalid
  And an error summary heading is shown as "There is a problem"
  And an error summary list descriptive link is shown as "Please enter a valid Kickstart application number"

Scenario: User does not enter a Kickstart application number
  Given that the User has not entered any value in the "Kickstart application number" field
  When the user clicks 'Continue'
  Then the Kickstart ID is invalid
  And an error summary heading is shown: "There is a problem"
  And an error summary list descriptive link is shown as "Please enter a Kickstart application number"
