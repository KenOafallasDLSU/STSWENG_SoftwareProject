*** Settings ***
Documentation       Resources for Robot Tests
###
###                 This test has a workflow that is created using keywords.
###                 directly from SeleniumLibrary
Library             SeleniumLibrary

*** Variables ***
${SERVER}             localhost:8080
${BROWSER}            Firefox
${DELAY}              0
${VALID FIRSTNAME}    GG
${VALID LASTNAME}     WP
${INVALID FIRSTNAME}  GG12
${INVALID LASTNAME}   WP34
${EXISTING EMAIL}     geosefuy@gmail.com
${VALID EMAIL}        GGWP123456@gmail.com
${INVALID EMAIL}      GGWP123456@gmail
${EXISTING USER}      GGWP1234
${VALID USER}         geosefuy  #GGWP123456
${INVALID USER}       GGWP1234!
${VALID PASSWORD}     P@ssword1  #GgWp123456!
${VALID PASSWORD2}     P@ssword2  #GgWp123456!
${NEWVALID PASSWORD}  GGWP123456!
${INVALID PASSWORD}   1234
${VALID ROOM}         t3st room
${INVALID ROOM}       cloudtest
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
    Open Browser  ${LOGIN URL}      Firefox
    Set Selenium Timeout            20 seconds
    Maximize Browser Window
    Set Selenium Speed              2
    Wait Until Page Contains Element    btnSubmit
    Login Button Should Be Disabled

Open Browser to Register Page
    Open Browser  ${REGISTER URL}   Firefox
    Set Selenium Timeout            20 seconds
    Maximize Browser Window
    Set Selenium Speed              2
    Wait Until Page Contains Element    btnSubmit
    Login Button Should Be Disabled

Login Button Should Be Enabled
    Element Should Be Enabled       btnSubmit

Register Button Should Be Enabled
    Element Should Be Enabled       btnSubmit

Login Button Should Be Disabled
    Element Should Be Disabled       btnSubmit

Register Button Should Be Disabled
    Element Should Be Disabled       btnSubmit

Input Username
    [Arguments]   ${Username}
    Input Text    loginUsername     ${Username}

Input Password
    [Arguments]   ${Password}
    Input Text    loginPassword     ${Password}

Input First Name
    [Arguments]   ${FirstName}
    Input Text    firstName         ${FirstName}

Input Last Name
    [Arguments]   ${LastName}
    Input Text    lastName          ${LastName}

Input Register Username
    [Arguments]   ${RegUsername}
    Input Text    regUsername       ${RegUsername}

Input Email
    [Arguments]   ${Email}
    Input Text    email             ${Email}

Input Register Password
    [Arguments]   ${RegPassword}
    Input Text    password          ${RegPassword}

Input ChangePW Password
    [Arguments]   ${Password}
    Input Text    password          ${Password}

Input Confirm Password
    [Arguments]   ${ConfirmPassword}
    Input Text    confirmPassword   ${ConfirmPassword}

Input New Password
    [Arguments]   ${Password}
    Input Text    password   ${Password}

Input Confirm New Password
    [Arguments]   ${ConfirmPassword}
    Input Text    confirm-password   ${ConfirmPassword}

Input Room Name
    [Arguments]   ${RoomName}
    Input Text    room-name-input   ${RoomName}

Wait For Page Load
    Wait Until Page Contains Element    menu

Click Login Button
    Click Button                    btnSubmit

Click Login here Text
    Click Element                   linkLogin

Click Register Button
    Click Button                    btnSubmit

Click Continue Button
    Click Button                    btnSubmit

Click Register now Text
    Click Element                   linkRegister

Click Sidenav
    Click Element                   menu

Click Play
    Click Element                   xpath=//button[@id='lobby']/h3

Click Profile
    Click Element                   xpath=//a[@id='profile']/h3

Click Leaderboard
    Click Element                   xpath=//a[@id='leaderboard']/h3

Click Triangle Right Icon
    Click Element                   class:triangle-right

Click Triangle Left Icon
    Click Element                   class:triangle-left

Click How to Play
    Click Element                   xpath=//a[@id='help']/h3

Click Same Field
    Click Element                   css=.router-link-exact-active > .cursor-pointer

Click Logout
    Click Element                   xpath=//button[@id='logout']/h3

Click Change Password
    Click Element                   change-pw

Click Create Room
    Click Element                   headerButton

Click Create
    Click Element                   create-button

Click Public
    Click Element                   type-select
    Click Element                   xpath=//option[contains(.,'Public')]
    
Click Private
    Click Element                   type-select
    Click Element                   xpath=//option[contains(.,'Private')]

SELECT 10 MIN
    Click Element                   minutes-10

SELECT 5 MIN
    Click Element                   minutes-5

SELECT 3 MIN
    Click Element                   minutes-3

SELECT 1 MIN
    Click Element                   minutes-1

Close Room
    Click Element                   xpath=//div[@id='left-button']/button
    
Game Lobby Page Should Be Open
    Wait For Page Load
    Location Should Be              ${GAME LOBBY URL}
    Element Should be Visible       GameLobbyTable
    Element Should be Visible       headerName
    Element Should be Visible       headerHost
    Element Should be Visible       headerButtonCont
    Set Selenium Speed              2

Waiting Room Page Should Be Open
    Wait For Page Load
    Element Should be Visible       waiting-room-label
    Element Should be Visible       left-panel
    Element Should be Visible       right-panel
    Set Selenium Speed              2

Register Page Should Be Open
    Location Should Be              ${REGISTER URL}
    Element Should be Visible       firstName
    Element Should be Visible       lastName
    Element Should be Visible       regUsername
    Element Should be Visible       email
    Element Should be Visible       password
    Element Should be Visible       confirmPassword
    Set Selenium Speed              2

Login Page Should Be Open
    Location Should Be              ${LOGIN URL}
    Element Should be Visible       pageLogin
    Element Should be Visible       loginUsername
    Element Should be Visible       loginPassword
    Set Selenium Speed              2

Profile Page Should Be Open
    Wait For Page Load
    Location Should Be              ${PROFILE URL}
    Element Should be Visible       user-details
    Element Should be Visible       hello
    Set Selenium Speed              2

Leaderboard Page Should Be Open
    Wait For Page Load
    Location Should Be              ${LEADERBOARD URL}
    Element Should be Visible       LeaderboardPage
    Element Should be Visible       LeaderboardTable
    Element Should be Visible       CriteriaSelect
    Set Selenium Speed              2

Rank Username And Score Should Be Visible
    Element Should be Visible       class:leaderRank
    Element Should be Visible       class:leaderName
    Element Should be Visible       class:leaderScore
    Set Selenium Speed              3

Instruction Page Should Be Open
    Wait For Page Load
    Location Should Be              ${INSTRUCTION URL}
    Element Should be Visible       instructions-box
    Set Selenium Speed              2

Change Password Page Should Be Open
    Wait For Page Load
    Location Should Be              ${CHANGEPW URL}
    Element Should be Visible       sectionLoginForm
    Element Should be Visible       email
    Element Should be Visible       password
    Element Should be Visible       go-back
    Set Selenium Speed              2

New Password Page Should Be Open
    Wait For Page Load
    Location Should Be              ${CHANGEPW2 URL}
    Element Should be Visible       sectionLoginForm
    Element Should be Visible       password
    Element Should be Visible       confirm-password
    Element Should be Visible       go-back
    Set Selenium Speed              2

Element Message Open Login
    [Arguments]   ${Error}
    Element Text Should Be          loginErrorMessages    ${Error}

Element Message Open Register
    [Arguments]   ${Error}
    Element Text Should Be          registerError         ${Error}

Table Header Leaderboard
    [Arguments]   ${Criteria}
    Element Text Should Be          headerScore           ${Criteria}

Game Lobby Page Number
    [Arguments]   ${Criteria}
    Element Text Should Be          criteriaLabel           ${Criteria}

Element Message Open ChangePW
    [Arguments]   ${Error}
    Element Text Should Be          loginErrorMessages    ${Error}

Element Message Open NewPW
    [Arguments]   ${Error}
    Element Text Should Be          loginErrorMessages    ${Error}

Element Message Open Create
    [Arguments]   ${Error}
    Element Text Should Be          name-alert    ${Error}

Create Button Enabled
    Element Should Be Enabled       create-button

Create Button Disabled
    Element Should Be Disabled      create-button