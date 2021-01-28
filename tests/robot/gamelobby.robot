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
    Wait For Page Load
    Game Lobby Page Should Be Open
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
    Wait For Page Load
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
    Wait For Page Load
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
    Wait For Page Load
    Game Lobby Page Should Be Open
    Click Sidenav
    Click Logout
    Login Page Should Be Open
    [Teardown]                    Close Browser

Displaying of Different Pages of Game Lobbies
    Open Browser to Login Page
    Input Username                      ${VALID USER}
    Input Password                      ${VALID PASSWORD}
    Click Login Button
    Wait For Page Load
    Game Lobby Page Number              1
    [Teardown]                          Close Browser
    
Functionality Checking for Create Room
    Open Browser to Login Page
    Input Username                      ${VALID USER}
    Input Password                      ${VALID PASSWORD}
    Click Login Button
    Wait For Page Load
    Click Create Room
    Create Button Disabled
    Input Room Name                     ${INVALID ROOM}
    Click Public
    Click Private
    Create Button Disabled
    SELECT 10 MIN
    SELECT 5 MIN
    SELECT 3 MIN
    SELECT 1 MIN
    Create Button Enabled
    [Teardown]                          Close Browser

Displaying of Error Message for Create Room
    Open Browser to Login Page
    Input Username                      ${VALID USER}
    Input Password                      ${VALID PASSWORD}
    Click Login Button
    Wait For Page Load
    Click Create Room
    Input Room Name                     ${INVALID ROOM}
    Click Public
    SELECT 10 MIN
    Click Create
    Element Should Be Visible           name-alert
    Element Message Open Create         Room name not available!
    [Teardown]                          Close Browser

Redirecting to Waiting Room after Create Room
    Open Browser to Login Page
    Input Username                      ${VALID USER}
    Input Password                      ${VALID PASSWORD}
    Click Login Button
    Wait For Page Load
    Click Create Room
    Input Room Name                     ${VALID ROOM}
    Click Public
    SELECT 10 MIN
    Click Create
    Waiting Room Page Should Be Open
    Close Room
    [Teardown]                          Close Browser