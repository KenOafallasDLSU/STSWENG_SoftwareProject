*** Settings ***
Documentation       A test suite with tests for game lobby.
###
###                 This test has a workflow that is created using keywords.
###                 directly from SeleniumLibrary
Resource            resource.robot

*** Test Cases ***
Staying on Game Lobby Page after Play text is clicked
    Open Browser to Login Page
    Input Username                ${VALID USER}
    Input Password                ${VALID PASSWORD}
    Click Login Button
    Click Sidenav
    Click Play
    Game Lobby Page Should Be Open
    Click Sidenav
    Click Same Field
    Game Lobby Page Should Be Open
    [Teardown]                    Close Browser

Redirecting URL to Profile Page after Profile text is clicked
    Open Browser to Login Page
    Input Username                ${VALID USER}
    Input Password                ${VALID PASSWORD}
    Click Login Button
    Click Sidenav
    Click Play
    Game Lobby Page Should Be Open
    Click Sidenav
    Click Profile
    Profile Page Should Be Open
    [Teardown]                    Close Browser


Redirecting URL to Leaderboard Page after Leaderboard text is clicked
    Open Browser to Login Page
    Input Username                ${VALID USER}
    Input Password                ${VALID PASSWORD}
    Click Login Button
    Click Sidenav
    Click Play
    Game Lobby Page Should Be Open
    Click Sidenav
    Click Leaderboard
    Leaderboard Page Should Be Open
    [Teardown]                    Close Browser

Redirecting URL to Instruction Page after How to Play text is clicked
    Open Browser to Login Page
    Input Username                ${VALID USER}
    Input Password                ${VALID PASSWORD}
    Click Login Button
    Click Sidenav
    Click Play
    Game Lobby Page Should Be Open
    Click Sidenav
    Click How to Play
    Instruction Page Should Be Open
    [Teardown]                    Close Browser

Redirecting URL to Login Page after Logout text is clicked
    Open Browser to Login Page
    Input Username                ${VALID USER}
    Input Password                ${VALID PASSWORD}
    Click Login Button
    Click Sidenav
    Click Play
    Game Lobby Page Should Be Open
    Click Sidenav
    Click Logout
    Login Page Should Be Open
    [Teardown]                    Close Browser

## CREATE ROOM FUNCTION