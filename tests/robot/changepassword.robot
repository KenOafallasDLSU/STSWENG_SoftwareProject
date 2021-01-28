*** Settings ***
Documentation       A test suite with tests for change password.
###
###                 This test has a workflow that is created using keywords.
###                 directly from SeleniumLibrary
Resource            resource.robot

*** Test Cases ***
Redirecting URL to Game Lobby Page after Play text is clicked
    Open Browser to Login Page
    Input Username                ${VALID USER}
    Input Password                ${VALID PASSWORD}
    Click Login Button
    Wait For Page Load
    Click Sidenav
    Click Profile
    Click Change Password
    Click Sidenav
    Click Play
    Game Lobby Page Should Be Open
    [Teardown]                    Close Browser

Redirecting URL to Profile Page after Profile text is clicked
    Open Browser to Login Page
    Input Username                ${VALID USER}
    Input Password                ${VALID PASSWORD}
    Click Login Button
    Wait For Page Load
    Click Sidenav
    Click Profile
    Click Change Password
    Click Sidenav
    Click Profile
    Profile Page Should Be Open
    [Teardown]                    Close Browser

Redirecting URL to Leaderboard Page after Leaderboard text is clicked
    Open Browser to Login Page
    Input Username                ${VALID USER}
    Input Password                ${VALID PASSWORD}
    Click Login Button
    Wait For Page Load
    Click Sidenav
    Click Profile
    Click Change Password
    Click Sidenav
    Click Leaderboard
    Leaderboard Page Should Be Open
    [Teardown]                    Close Browser

Redirecting URL to Instruction Page after How to Play text is clicked
    Open Browser to Login Page
    Input Username                ${VALID USER}
    Input Password                ${VALID PASSWORD}
    Click Login Button
    Wait For Page Load
    Click Sidenav
    Click Profile
    Click Change Password
    Click Sidenav
    Click How to Play
    Instruction Page Should Be Open
    [Teardown]                    Close Browser

Redirecting URL to Login Page after Logout text is clicked
    Open Browser to Login Page
    Input Username                ${VALID USER}
    Input Password                ${VALID PASSWORD}
    Click Login Button
    Wait For Page Load
    Click Sidenav
    Click Profile
    Click Change Password
    Click Sidenav
    Click Logout
    Login Page Should Be Open
    [Teardown]                    Close Browser

Error Message Display for Change Password Step 1
    Open Browser to Login Page
    Input Username                ${VALID USER}
    Input Password                ${VALID PASSWORD}
    Click Login Button
    Wait For Page Load
    Click Sidenav
    Click Profile
    Click Change Password
    Input Email                   ${INVALID EMAIL}
    Input ChangePW Password       ${INVALID PASSWORD}
    Click Continue Button
    Element Message Open ChangePW  The email you entered is incorrect.
    Input Email                   ${EXISTING EMAIL}
    Click Continue Button
    Element Message Open ChangePW  The password you entered is incorrect.
    [Teardown]                    Close Browser

Redirecting URL to New Password Page After Successful Verify
    Open Browser to Login Page
    Input Username                ${VALID USER}
    Input Password                ${VALID PASSWORD}
    Click Login Button
    Wait For Page Load
    Click Sidenav
    Click Profile
    Click Change Password
    Input Email                   ${EXISTING EMAIL}
    Input ChangePW Password       ${VALID PASSWORD}
    Click Continue Button
    New Password Page Should Be Open
    [Teardown]                    Close Browser


Error Message Display for Change Password Step 2
    Open Browser to Login Page
    Input Username                ${VALID USER}
    Input Password                ${VALID PASSWORD}
    Click Login Button
    Wait For Page Load
    Click Sidenav
    Click Profile
    Click Change Password
    Input Email                   ${EXISTING EMAIL}
    Input ChangePW Password       ${VALID PASSWORD}
    Click Continue Button
    Input New Password            ${INVALID PASSWORD}
    Input Confirm New Password    ${INVALID PASSWORD}
    Click Continue button
    Element Message Open NewPW    Password must contain at least 8 characters, 1 uppercase letter, 1 lowercase letter, 1 number, and 1 special character.
    Input New Password            ${VALID PASSWORD}
    Input Confirm New Password    ${VALID PASSWORD2}
    Click Continue Button
    Element Message Open NewPW    Passwords don't match.
    Input New Password            ${VALID PASSWORD}
    Input Confirm New Password    ${VALID PASSWORD}
    Click Continue Button
    Element Message Open NewPW    New password can't be the same as the old password.
    [Teardown]                    Close Browser

Redirecting URL to Login Page After Successful Change Password
    Open Browser to Login Page
    Input Username                ${VALID USER}
    Input Password                ${VALID PASSWORD}
    Click Login Button
    Wait For Page Load
    Click Sidenav
    Click Profile
    Click Change Password
    Input Email                   ${EXISTING EMAIL}
    Input ChangePW Password       ${VALID PASSWORD}
    Click Continue button
    Input New Password            ${NEWVALID PASSWORD}
    Input Confirm New Password    ${NEWVALID PASSWORD}
    Click Continue Button
    [Teardown]                    Close Browser