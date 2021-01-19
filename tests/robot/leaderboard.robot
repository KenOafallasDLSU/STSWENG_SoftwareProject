*** Settings ***
Documentation       A test suite with tests for leaderboard.
###
###                 This test has a workflow that is created using keywords.
###                 directly from SeleniumLibrary
Resource            resource.robot

*** Test Cases ***
Redirecting URL to Game Lobby Page after Play text is clicked
    Open Browser to Login Page
    Input Username                      ${VALID USER}
    Input Password                      ${VALID PASSWORD}
    Click Login Button
    Click Sidenav
    Click Leaderboard
    Leaderboard Page Should Be Open
    Click Sidenav
    Click Play
    Game Lobby Page Should Be Open
    [Teardown]                          Close Browser

Redirecting URL to Profile Page after Profile text is clicked
    Open Browser to Login Page
    Input Username                      ${VALID USER}
    Input Password                      ${VALID PASSWORD}
    Click Login Button
    Click Sidenav
    Click Leaderboard
    Leaderboard Page Should Be Open
    Click Sidenav
    Click Profile
    Profile Page Should Be Open
    [Teardown]                          Close Browser

Staying on Leaderboard Page after Leaderboard text is clicked
    Open Browser to Login Page
    Input Username                      ${VALID USER}
    Input Password                      ${VALID PASSWORD}
    Click Login Button
    Click Sidenav
    Click Leaderboard
    Leaderboard Page Should Be Open
    Click Sidenav
    Click Same Field
    Leaderboard Page Should Be Open
    [Teardown]                          Close Browser

Redirecting URL to Instruction Page after How to Play text is clicked
    Open Browser to Login Page
    Input Username                      ${VALID USER}
    Input Password                      ${VALID PASSWORD}
    Click Login Button
    Click Sidenav
    Click Leaderboard
    Leaderboard Page Should Be Open
    Click Sidenav
    Click How to Play
    Instruction Page Should Be Open
    [Teardown]                          Close Browser

Redirecting URL to Login Page after Logout text is clicked
    Open Browser to Login Page
    Input Username                      ${VALID USER}
    Input Password                      ${VALID PASSWORD}
    Click Login Button
    Click Sidenav
    Click Leaderboard
    Leaderboard Page Should Be Open
    Click Sidenav
    Click Logout
    Login Page Should Be Open
    [Teardown]                          Close Browser

Displaying of different leaderboard criterion
    Open Browser to Login Page
    Input Username                      ${VALID USER}
    Input Password                      ${VALID PASSWORD}
    Click Login Button
    Click Sidenav
    Click Leaderboard
    Leaderboard Page Should Be Open
    Table Header Leaderboard            Elo Rating
    Click Triangle Right Icon
    Table Header Leaderboard            Win Rate
    Click Triangle Right Icon
    Table Header Leaderboard            Total Wins
    Click Triangle Right Icon
    Table Header Leaderboard            Wins on White
    Click Triangle Right Icon
    Table Header Leaderboard            Wins on Black
    [Teardown]                          Close Browser

Displaying of rank, username and points in the leaderboard in a table format
    Open Browser to Login Page
    Input Username                      ${VALID USER}
    Input Password                      ${VALID PASSWORD}
    Click Login Button
    Click Sidenav
    Click Leaderboard
    Leaderboard Page Should Be Open
    Rank Username And Score Should Be Visible
    [Teardown]                          Close Browser
