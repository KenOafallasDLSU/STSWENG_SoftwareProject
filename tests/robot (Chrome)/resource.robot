*** Settings ***
Documentation       Resources for Robot Tests
###
###                 This test has a workflow that is created using keywords.
###                 directly from SeleniumLibrary
Library             SeleniumLibrary

*** Variables ***
${SERVER}             localhost:8080
# Firefox
${BROWSER}            Chrome
${DELAY}              0
${VALID FIRSTNAME}    GG
${VALID LASTNAME}     WP
${INVALID FIRSTNAME}  GG12
${INVALID LASTNAME}   WP34
${EXISTING EMAIL}     geosefuy@gmail.com
${VALID EMAIL}        GGWP123456@gmail.com
${INVALID EMAIL}      GGWP123456@gmail
${EXISTING USER}      GGWP1234
# geosefuy
${VALID USER}         GGWP123456
${INVALID USER}       GGWP1234!
# P@ssword1
${VALID PASSWORD}     GgWp123456!
${NEWVALID PASSWORD}  P@ssword1
${INVALID PASSWORD}   1234
${VALID ROOM}         t3st room
${INVALID ROOM}       AAAA
${LOGIN URL}          http://${SERVER}/#/login
${REGISTER URL}       http://${SERVER}/#/register
${GAME LOBBY URL}     http://${SERVER}/#/
${PROFILE URL}        http://${SERVER}/#/profile
${LEADERBOARD URL}    http://${SERVER}/#/leaderboard
${INSTRUCTION URL}    http://${SERVER}/#/help
${CHANGEPW URL}       http://${SERVER}/#/change-password
${CHANGEPW2 URL}      http://${SERVER}/#/change-password/confirm

*** keywords ***
Open Browser to Login Page
    Open Browser  ${LOGIN URL}          Chrome
    Set Selenium Timeout                5 seconds
    Maximize Browser Window
    Set Selenium Speed                  3
    Wait Until Page Contains Element    btnSubmit
    Login Button Should Be Disabled

Open Browser to Register Page
    Open Browser  ${REGISTER URL}       Chrome
    Set Selenium Timeout                5 seconds
    Maximize Browser Window
    Set Selenium Speed                  3
    Wait Until Page Contains Element    btnSubmit
    Login Button Should Be Disabled

Login Button Should Be Enabled
    Element Should Be Enabled           btnSubmit

Register Button Should Be Enabled
    Element Should Be Enabled           btnSubmit

Login Button Should Be Disabled
    Element Should Be Disabled          btnSubmit

Register Button Should Be Disabled
    Element Should Be Disabled          btnSubmit

Input Username
    [Arguments]   ${Username}
    Input Text    loginUsername         ${Username}

Input Password
    [Arguments]   ${Password}
    Input Text    loginPassword         ${Password}

Input First Name
    [Arguments]   ${FirstName}
    Input Text    firstName             ${FirstName}

Input Last Name
    [Arguments]   ${LastName}
    Input Text    lastName              ${LastName}

Input Register Username
    [Arguments]   ${RegUsername}
    Input Text    regUsername           ${RegUsername}

Input Email
    [Arguments]   ${Email}
    Input Text    email                 ${Email}

Input Register Password
    [Arguments]   ${RegPassword}
    Input Text    password              ${RegPassword}

Input Confirm Password
    [Arguments]   ${ConfirmPassword}
    Input Text    confirmPassword       ${ConfirmPassword}

Input Old Password
    [Arguments]   ${Password}
    Input Text    password              ${Password}

Input New Password
    [Arguments]   ${Password}
    Input Text    password              ${Password}

Input Confirm New Password
    [Arguments]   ${ConfirmPassword}
    Input Text    confirm-password      ${ConfirmPassword}

Input Room Name
    [Arguments]   ${RoomName}
    Input Text    room-name-input       ${RoomName}

Click Login Button
    Click Button                        btnSubmit

Click Login here Text
    Click Element                       linkLogin

Click Register Button
    Click Button                        btnSubmit

Click Continue Button
    Click Button                        btnSubmit

Click Register now Text
    Click Element                       linkRegister

Click Sidenav
    Click Element                       menu

Click Play
    Click Element                       xpath=//button[@id='lobby']/h3

Click Profile
    Click Element                       xpath=//a[@id='profile']/h3

Click Leaderboard
    Click Element                       xpath=//a[@id='leaderboard']/h3

Click Triangle Right Icon
    Click Element                       class:triangle-right

Click Triangle Left Icon
    Click Element                       class:triangle-left

Click How to Play
    Click Element                       xpath=//a[@id='help']/h3

Click Same Field
    Click Element                       css=.router-link-exact-active > .cursor-pointer

Click Logout
    Click Element                       xpath=//button[@id='logout']/h3

Click Change Password
    Click Element                       change-pw

Click Create Room
    Click Element                       headerButton

Click Create
    Click Element                       create-button

SELECT 10 MIN
    Click Element                       minutes-10

SELECT 5 MIN
    Click Element                       minutes-5

SELECT 3 MIN
    Click Element                       minutes-3

SELECT 1 MIN
    Click Element                       minutes-1

Game Lobby Page Should Be Open
    Set Selenium Speed                  3
    Location Should Be                  ${GAME LOBBY URL}
    Element Should be Visible           GameLobbyTable
    Element Should be Visible           headerName
    Element Should be Visible           headerHost
    Element Should be Visible           headerButtonCont

Waiting Room Page Should Be Open
    Set Selenium Speed                  3
    ### Temporary
    Element Should be Visible           waiting-room-label
    Element Should be Visible           room-type
    Element Should be Visible           room-info
    Element Should be Visible           owner-data
    Element Should be Visible           util-buttons

Register Page Should Be Open
    Set Selenium Speed                  3
    Location Should Be                  ${REGISTER URL}
    Element Should be Visible           firstName
    Element Should be Visible           lastName
    Element Should be Visible           regUsername
    Element Should be Visible           email
    Element Should be Visible           password
    Element Should be Visible           confirmPassword

Login Page Should Be Open
    Set Selenium Speed                  3
    Location Should Be                  ${LOGIN URL}
    Element Should be Visible           pageLogin
    Element Should be Visible           loginUsername
    Element Should be Visible           loginPassword

Profile Page Should Be Open
    Set Selenium Speed                  3
    Location Should Be                  ${PROFILE URL}
    Element Should be Visible           user-details
    Element Should be Visible           hello

Leaderboard Page Should Be Open
    Set Selenium Speed                  3
    Location Should Be                  ${LEADERBOARD URL}
    Element Should be Visible           LeaderboardPage
    Element Should be Visible           LeaderboardTable
    Element Should be Visible           CriteriaSelect

Rank Username And Score Should Be Visible
    Set Selenium Speed                  3
    Element Should be Visible           class:leaderRank
    Element Should be Visible           class:leaderName
    Element Should be Visible           class:leaderScore

Instruction Page Should Be Open
    Set Selenium Speed                  3
    Location Should Be                  ${INSTRUCTION URL}
    Element Should be Visible           instructions-box

Change Password Page Should Be Open
    Set Selenium Speed                  3
    Location Should Be                  ${CHANGEPW URL}
    Element Should be Visible           sectionLoginForm
    Element Should be Visible           email
    Element Should be Visible           password
    Element Should be Visible           go-back

New Password Page Should Be Open
    Set Selenium Speed                  3
    Location Should Be                  ${CHANGEPW2 URL}
    Element Should be Visible           sectionLoginForm
    Element Should be Visible           password
    Element Should be Visible           confirm-password
    Element Should be Visible           go-back

Element Message Open Login
    [Arguments]   ${Error}
    Element Text Should Be              loginErrorMessages    ${Error}

Element Message Open Register
    [Arguments]   ${Error}
    Element Text Should Be              registerError         ${Error}

Table Header Leaderboard
    [Arguments]   ${Criteria}
    Element Text Should Be              headerScore           ${Criteria}

Game Lobby Page Number
    [Arguments]   ${Criteria}
    Element Text Should Be              criteriaLabel         ${Criteria}

Element Message Open ChangePW
    [Arguments]   ${Error}
    Element Text Should Be              loginErrorMessages    ${Error}

Element Message Open NewPW
    [Arguments]   ${Error}
    Element Text Should Be              loginErrorMessages    ${Error}

Element Message Open Create
    [Arguments]   ${Error}
    Element Text Should Be              name-alert            ${Error}

Create Button Enabled
    Element Should Be Enabled           create-button

Create Button Disabled
    Element Should Be Disabled          create-button
