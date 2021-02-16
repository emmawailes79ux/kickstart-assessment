Feature: A job advert is attached as part of adding a new vacancy

Description: As an employer, I need to be able to add details to advertise a role to a claimant, so that I can attract claimants and provide the DWP with the information they need about a role.

  - Link to prototype: https://kickstart-assessment.herokuapp.com/employer/mvp/job-add-2
  - Jira stories related to this feature: https://jira.service.dwpcloud.uk/browse/KICK-913
  - All the fields are mandatory
  - User could be either an Employer or a Gateway

Flow:
  - Previous page is Initial Vacancy Details [KICK-904]
  - Next page is Vacancy Start and Finish Dates [KICK-1051]

# Back

Scenario: User chooses to go back
  Given that the User is on the Add a Job advert to a vacancy page
  When the User clicks the "Back Link"
  Then the User must be routed back to the Vacancy Details page [KICK-904]

# About the Job

Scenario: User does not enter anything into the "About the Job" field
  Given that the User does not enter anything into the "About the Job" field
  When the User clicks "Continue"
  Then the "About the job" field is invalid
  And an error summary heading is shown as "There is a problem"
  And an error summary list descriptive link is shown as "Please describe the job"

Scenario: User enters over 2000 characters into the "About the Job" field
  Given that the User enters more than 2000 characters into the "About the Job" field
  When the User clicks "Continue"
  Then the "About the job" field is invalid
  And an error summary heading is shown as "There is a problem"
  And an error summary list descriptive link is shown as "Please describe the job in 2000 characters or less"

Scenario: User enters under 100 characters into the "About the Job" field
  Given that the User enters less than 100 characters into the "About the Job" field
  When the User clicks "Continue"
  Then the "About the job" field is invalid
  And an error summary heading is shown as "There is a problem"
  And an error summary list descriptive link is shown as "Please describe the job in at least 100 characters or more"

Scenario Outline: User enters a value into the "About the Job" that contains special characters or any other non-alphanumeric values
  Given that I am a User who enters a value that contains special characters or any other non-alphanumeric values for <About the Job>
  When I click "Continue"
  Then the <About the Job> is invalid
  And an error summary heading is shown as "There is a problem"
  And an error summary list descriptive link is shown as "Please do not include any special characters in describing this job"

  Examples:
  | <About the Job>                              | <Displayed Text>                                                      |
  | "A great job within the ret@il sector..."    | "Please do not include any special characters in describing this job" |

# What are you looking for

Scenario: User does not enter anything into the "What are you looking for?" Field
  Given that the User does not enter anything into the "What are you looking for?" field
  When the User clicks "Continue"
  Then the "What are you looking for?" field is invalid
  And an error summary heading is shown as "There is a problem"
  And an error summary list descriptive link is shown as "Please describe what you are looking for"

Scenario: User enters over 2000 characters into the "What are you looking for?" Field
  Given that the User does not enter anything into the "What are you looking for?" field
  When the User clicks "Continue"
  Then the "What are you looking for?" field is invalid
  And an error summary heading is shown as "There is a problem"
  And an error summary list descriptive link is shown as "Please describe what you are looking for in 2000 characters or less"

Scenario: User enters under 100 characters into the "What are you looking for?" Field
  Given that the User enters less than 100 characters into the "What are you looking for?" field
  When the User clicks "Continue"
  Then the "What are you looking for?" field is invalid
  And an error summary heading is shown as "There is a problem"
  And an error summary list descriptive link is shown as "Please describe what you are looking for in at least 100 characters or more"

Scenario Outline: User enters a value in the "What are you looking for" field field that contains special characters or any other non-alphanumeric values
  Given that I am a User who enters a value that contains special characters or any other non-alphanumeric values for <What are you looking for>
  When I click "Continue"
  Then the <What are you looking for> field is invalid
  And an error summary heading is shown as "There is a problem"
  And an error summary list descriptive link is shown as "Please do not include any special characters in describing this job"

  Examples:
  | <What are you looking for>                                     | <Displayed Text>                                                                      |
  | "A great candidate with experience in the ret@il sector..."    | "Please do not include any special characters in describing what you are looking for" |

# Tell us about your company

Scenario: User does not enter anything into the "Tell us about your company" field
  Given that the User does not enter anything into the "Tell us about your company" field
  When the User clicks "Continue"
  Then the "Tell us about your company" field is invalid
  And an error summary heading is shown as "There is a problem"
  And an error summary list descriptive link is shown as "Please describe your company"

Scenario: User enters over 2000 characters into the "Tell us about your company" field
  Given that the User enters more than 2000 characters into the "Tell us about your company" field
  When the User clicks "Continue"
  Then the "Tell us about your company" field is invalid
  And an error summary heading is shown as "There is a problem"
  And an error summary list descriptive link is shown as "Please describe your company in 2000 characters or less"

Scenario: User enters under 100 characters into the "Tell us about your company" field
  Given that the User enters less than 100 characters into the "Tell us about your company" field
  When the User clicks "Continue"
  Then the "Tell us about your company" field is invalid
  And an error summary heading is shown as "There is a problem"
  And an error summary list descriptive link is shown as "Please describe your company in at least 100 characters or more"

Scenario Outline: User enters a value in the "Tell us about your company" field that contains special characters or any other non-alphanumeric values
  Given that I am a User who enters a value that contains special characters or any other non-alphanumeric values for <Tell us about your company>
  When I click "Continue"
  Then the <Tell us about your company> field is invalid
  And an error summary heading is shown as "There is a problem"
  And an error summary list descriptive link is shown as "Please do not include any special characters in describing your company"

  Examples:
  | <Tell us about your company>                 | <Displayed Text>                                                          |
  | "A great company in the ret@il sector..."    | "Please do not include any special characters in describing your company" |

# What can you offer the Kickstarter?

Scenario: User does not enter anything into the "What can you offer the Kickstarter?" field
  Given that the User does not enter anything into the "What can you offer the Kickstarter?" field
  When the User clicks "Continue"
  Then the "What can you offer the Kickstarter?" field is invalid
  And an error summary heading is shown as "There is a problem"
  And an error summary list descriptive link is shown as "Please enter details about what you can offer the Kickstarter"

Scenario: User enters over 2000 characters into the "What can you offer the Kickstarter?" Field
  Given that the User enters more than 2000 characters into the "Tell us about your company" field
  When the User clicks "Continue"
  Then the "What can you offer the Kickstarter" field is invalid
  And an error summary list descriptive link is shown as "Please describe what you can offer the Kickstarter in 2000 characters or less"

Scenario: User enters under 100 characters into the "What can you offer the Kickstarter?" Field
  Given that the User enters less than 100 characters into the "What can you offer the Kickstarter" field
  When the User clicks "Continue"
  Then the "What can you offer the Kickstarter" field is invalid
  And an error summary heading is shown as "There is a problem"
  And an error summary list descriptive link is shown as "Please describe what you can offer Kickstarter in at least 100 characters or more"

Scenario Outline: User enters a value in the "What can you offer the Kickstarter?" field that contains special characters or any other non-alphanumeric values
  Given that I am a User who enters a value that contains special characters or any other non-alphanumeric values for <What can you offer the Kickstarter>
  When I click "Continue"
  Then the <What can you offer the Kickstarter> field is invalid
  And an error summary heading is shown as "There is a problem"
  And an error summary list descriptive link is shown as "Please do not include any special characters in describing what you can offer the Kickstarter"

  Examples:
  | <What can you offer the Kickstarter>                | <Displayed Text>                                                                                |
  | "A great job experience in the ret@il sector..."    | "Please do not include any special characters in describing what you can offer the Kickstarter" |

# How to Apply

Scenario: User does not enter anything into the "How to Apply" field
  Given that the User does not enter anything into the "How to Apply?" field
  When the User clicks "Continue"
  Then the "How to Apply" field is invalid
  And an error summary heading is shown as "There is a problem"
  And an error summary list descriptive link is shown as "Please enter details about how to apply for this job"

Scenario: User enters over 1000 characters into the "How to Apply" field
  Given that the User enters more than 1000 characters into the "How to Apply" field
  When the User clicks "Continue"
  Then the "How to Apply" field is invalid
  And an error summary heading is shown as "How to Apply"
  And an error summary list descriptive link is shown as "Please describe how to apply in 2000 characters or less"

Scenario: User enters under 100 characters into the "How to Apply" field
  Given that the User enters less than 100 characters into the "How to Apply" field
  When the User clicks "Continue"
  Then the "How to Apply" field is invalid
  And an error summary heading is shown as "How to Apply"
  And an error summary list descriptive link is shown as "Please describe how to apply in 100 characters or more"

Scenario Outline: User enters a value in the "How to Apply?" field that contains special characters or any other non-alphanumeric values
  Given that I am a User who enters a value that contains special characters or any other non-alphanumeric values for <How to Apply>
  When I click "Continue"
  Then the <How to Apply> field is invalid
  And an error summary heading is shown as "There is a problem"
  And an error summary list descriptive link is shown as "Please do not include any special characters in describing how to apply for this job"

  Examples:
  | <What can you offer the Kickstarter>                | <Displayed Text>                                                                       |
  | "A great job experience in the ret@il sector..."    | "Please do not include any special characters in describing how to apply for this job" |

# Continue

Scenario: User has completed all form fields and clicks "Continue"
  Given that the User has completed all the form fields appropriately
  When the User clicks "Continue"
  Then the User must be redirected to the page to provide their vacancy start and finish dates [KICK-1051]

# Sign Out

Scenario: User can sign out
  Given that a User is within the Applicant service
  When the User clicks the 'Sign out' Link
  Then the User must be signed out of the service [KICK-XXXX]
