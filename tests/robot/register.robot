*** Settings ***
Documentation       A test suite with tests for register.
###
###                 This test has a workflow that is created using keywords.
###                 directly from SeleniumLibrary
Resource            resource.robot

*** Test Cases ***
Preprocessing of account during registration
    Open Browser to Register Page
    Input First Name                ${VALID FIRSTNAME}
    Input Last Name                 ${VALID LASTNAME}
    Input Register Username         ${VALID USER}
    Input Email                     ${VALID EMAIL}
    Input Register Password         ${VALID PASSWORD}
    Input Confirm Password          ${VALID PASSWORD}
    Register Button Should Be Enabled
    [Teardown]                      Close Browser

Displaying of different types of error messages during registration if invalid input(s) is(are) spotted
    Open Browser to Register Page
    Input First Name                ${INVALID FIRSTNAME}
    Input Last Name                 ${INVALID LASTNAME}
    Input Register Username         ${VALID USER}
    Input Email                     ${VALID EMAIL}
    Input Register Password         ${VALID PASSWORD}
    Input Confirm Password          ${VALID PASSWORD}
    Click Register Button
    Element Message Open Register   Name must contain letters only. If your name has spaces, use only one space.
    Clear Element Text              firstName
    Input First Name                ${VALID FIRSTNAME}
    Clear Element Text              lastName
    Input Last Name                 ${VALID LASTNAME}
    Clear Element Text              regUsername
    Input Register Username         ${INVALID USER}
    Click Register Button
    ###   No period in Username must contain letters and/or numbers only, and must be 8-20 characters long(.)
    Element Message Open Register   Username must contain letters and/or numbers only, and must be 8-20 characters long
    Clear Element Text              regUsername
    Input Register Username         ${EXISTING USER}
    Click Register Button
    Element Message Open Register   That username is already in use.
    Clear Element Text              regUsername
    Input Register Username         ${VALID USER}
    Clear Element Text              email
    Input Email                     ${INVALID EMAIL}
    Click Register Button
    Element Message Open Register   Please enter a valid email.
    Clear Element Text              email
    Input Email                     ${EXISTING EMAIL}
    Click Register button
    Element Message Open Register   That email is already in use.
    Clear Element Text              email
    Input Email                     ${VALID EMAIL}
    Clear Element Text              password
    Input Register Password         ${INVALID PASSWORD}
    Clear Element Text              confirmPassword
    Input Confirm Password          ${INVALID PASSWORD}
    Click Register Button
    Element Message Open Register   Password must contain at least 8 characters, 1 uppercase letter, 1 lowercase letter, 1 number, and 1 special character.
    Clear Element Text              password
    Input Register Password         ${VALID PASSWORD}
    Click Register Button
    Element Message Open Register   Passwords don't match.
    [Teardown]                      Close Browser

Disabling of button during registration when information given is incomplete
    Open Browser to Register Page
    Input First Name                ${VALID FIRSTNAME}
    Register Button Should Be Disabled
    Input Last Name                 ${VALID LASTNAME}
    Register Button Should Be Disabled
    Input Register Username         ${VALID USER}
    Register Button Should Be Disabled
    Input Email                     ${VALID EMAIL}
    Register Button Should Be Disabled
    Input Register Password         ${VALID PASSWORD}
    Register Button Should Be Disabled
    Input Confirm Password          ${VALID PASSWORD}
    Register Button Should Be Enabled
    [Teardown]                      Close Browser

Redirecting URL to Game Lobby Page after successful registration
    Open Browser to Register Page
    Input First Name                ${VALID FIRSTNAME}
    Input Last Name                 ${VALID LASTNAME}
    Input Register Username         ${VALID USER}
    Input Email                     ${VALID EMAIL}
    Input Register Password         ${VALID PASSWORD}
    Input Confirm Password          ${VALID PASSWORD}
    Click Register Button
    Game Lobby Page Should Be Open
    [Teardown]                      Close Browser
