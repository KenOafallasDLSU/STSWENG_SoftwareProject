*** Settings ***
Documentation       A test suite with tests for login.
###
###                 This test has a workflow that is created using keywords.
###                 directly from SeleniumLibrary
Resource            resource.robot

*** Test Cases ***
Displaying of different types of error messages during login if invalid input(s) is(are) spotted
    Open Browser to Login Page
    Input Username                ${INVALID USER}
    Input Password                ${INVALID PASSWORD}
    Click Login Button
    Element Message Open Login    This username does not exist.
    Clear Element Text            loginUsername
    Input Username                ${VALID USER}
    Click Login Button
    Element Message Open Login    Invalid password.
    [Teardown]                    Close Browser

Disabling of button during login when information given is incomplete
    Open Browser to Login Page
    Input Username                ${VALID USER}
    Login Button Should Be Disabled
    Clear Element Text            loginUsername
    Input Password                ${VALID PASSWORD}
    Login Button Should Be Disabled
    Input Username                ${VALID USER}
    Login Button Should Be Enabled
    [Teardown]                    Close Browser

Redirecting URL to Register Page after Register now text is clicked
    Open Browser to Login Page
    Click Register now Text
    Register Page Should Be Open
    [Teardown]                    Close Browser

Redirecting URL to Game Lobby Page after successful login
    Open Browser to Login Page
    Input Username                ${VALID USER}
    Input Password                ${VALID PASSWORD}
    Click Login Button
    Game Lobby Page Should Be Open
    [Teardown]                    Close Browser
