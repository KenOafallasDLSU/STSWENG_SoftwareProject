*** Settings ***
Documentation       Resources for Robot Tests
###
###                 This test has a workflow that is created using keywords.
###                 directly from SeleniumLibrary
Library             SeleniumLibrary

*** Variables ***
${SERVER}             localhost:8080
${BROWSER}            Chrome
${DELAY}              0
${VALID FIRSTNAME}    GG
${VALID LASTNAME}     WP
${INVALID FIRSTNAME}  GG12
${INVALID LASTNAME}   WP34
${EXISTING EMAIL}     Chenerwin28@gmail.com
${VALID EMAIL}        GGWP123456@gmail.com
${INVALID EMAIL}      GGWP123456@gmail
${EXISTING USER}      GGWP1234
${VALID USER}         GGWP123456
${INVALID USER}       GGWP1234!
${VALID PASSWORD}     GgWp123456!
${NEW VALID PASSWORD} GGWP123456!
${INVALID PASSWORD}   1234
${VALID ROOM}         t3st room
${INVALID ROOM}       Michiko Gomi's Room
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
    Open Browser  ${LOGIN URL}      Chrome
    Maximize Browser Window
    Set Selenium Speed              0
    Login Button Should Be Disabled

Open Browser to Register Page
    Open Browser  ${REGISTER URL}   Chrome
    Maximize Browser Window
    Set Selenium Speed              0
    Login Button Should Be Disabled

Login Button Should Be Enabled
    Element Should Be Visible       class:btn-secondary

Register Button Should Be Enabled
    Element Should Be Visible       class:btn-secondary

Login Button Should Be Disabled
    Element Should Be Visible       class:btn-secondary.disabled

Register Button Should Be Disabled
    Element Should Be Visible       class:btn-secondary.disabled

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
    ### Temporary
    Input Text    room-name   ${RoomName}

Click Login Button
    Set Selenium Speed              3
    ###   Temporary
    Click Button                    btnSubmit

Click Login here Text
    Set Selenium Speed              3
    Click Element                   linkLogin

Click Register Button
    Set Selenium Speed              3
    ###   Temporary
    Click Button                    btnSubmit

Click Continue Button
    Set Selenium Speed              3
    ###   Temporary
    Click Button                    btnSubmit

Click Register now Text
    Set Selenium Speed              3
    Click Element                   linkRegister

Click Sidenav
    Set Selenium Speed              3
    Click Element                   menu

Click Play
    Set Selenium Speed              3
    ###   Temporary
    Click Element                   css=.router-link:nth-child(1) > .cursor-pointer

Click Profile
    Set Selenium Speed              3
    ###   Temporary
    Click Element                   css=.router-link:nth-child(2) > .cursor-pointer

Click Leaderboard
    Set Selenium Speed              3
    ###   Temporary
    Click Element                   css=.router-link:nth-child(3) > .cursor-pointer

Click Triangle Right Icon
    Set Selenium Speed              3
    Click Element                   class:triangle-right

Click Triangle Left Icon
    Set Selenium Speed              3
    Click Element                   class:triangle-left

Click How to Play
    Set Selenium Speed              3
    ###   Temporary
    Click Element                   css=.router-link:nth-child(4) > .cursor-pointer

Click Same Field
    Set Selenium Speed              3
    Click Element                   css=.router-link-exact-active > .cursor-pointer

Click Logout
    Set Selenium Speed              3
    ###   Temporary
    Click Element                   css=.router-link:nth-child(5) > .cursor-pointer

Click Change Password
    Set Selenium Speed              3
    Click Element                   change-pw

Click Create Room
    Set Selenium Speed              3
    Click Element                   headerButton

Click Create
    Set Selenium Speed              3
    ### Temporary
    Click Element                   btnSubmit

SELECT 10 MIN
    Set Selenium Speed              3
    ### Temporary
    Click Element                   btnSubmit

SELECT 5 MIN
    Set Selenium Speed              3
    ### Temporary
    Click Element                   btnSubmit

SELECT 3 MIN
    Set Selenium Speed              3
    ### Temporary
    Click Element                   btnSubmit

SELECT 1 MIN
    Set Selenium Speed              3
    ### Temporary
    Click Element                   btnSubmit
    
Game Lobby Page Should Be Open
    Location Should Be              ${GAME LOBBY URL}
    Set Selenium Speed              0
    Element Should be Visible       GameLobbyTable
    Element Should be Visible       headerName
    Element Should be Visible       headerHost
    Element Should be Visible       headerButtonCont

Waiting Room Page Should Be Open
    ### Temporary
    Set Selenium Speed              0
    Element Should be Visible       GameLobbyTable
    Element Should be Visible       headerName
    Element Should be Visible       headerHost
    Element Should be Visible       headerButtonCont

Register Page Should Be Open
    Location Should Be              ${REGISTER URL}
    Set Selenium Speed              0
    Element Should be Visible       firstName
    Element Should be Visible       lastName
    Element Should be Visible       regUsername
    Element Should be Visible       email
    Element Should be Visible       password
    Element Should be Visible       confirmPassword

Login Page Should Be Open
    Location Should Be              ${LOGIN URL}
    Set Selenium Speed              0
    Element Should be Visible       pageLogin
    Element Should be Visible       loginUsername
    Element Should be Visible       loginPassword

Profile Page Should Be Open
    Location Should Be              ${PROFILE URL}
    Set Selenium Speed              0
    Element Should be Visible       user-details
    Element Should be Visible       hello

Leaderboard Page Should Be Open
    Location Should Be              ${LEADERBOARD URL}
    Set Selenium Speed              0
    Element Should be Visible       LeaderboardPage
    Element Should be Visible       LeaderboardTable
    Element Should be Visible       CriteriaSelect

Rank Username And Score Should Be Visible
    Set Selenium Speed              0
    Element Should be Visible       class:leaderRank
    Element Should be Visible       class:leaderName
    Element Should be Visible       class:leaderScore

Instruction Page Should Be Open
    Location Should Be              ${INSTRUCTION URL}
    Set Selenium Speed              0
    Element Should be Visible       instructions-box

Change Password Page Should Be Open
    Location Should Be              ${CHANGEPW URL}
    Set Selenium Speed              0
    Element Should be Visible       sectionLoginForm
    Element Should be Visible       email
    Element Should be Visible       password
    Element Should be Visible       go-back

New Password Page Should Be Open
    Location Should Be              ${CHANGEPW2 URL}
    Set Selenium Speed              0
    Element Should be Visible       sectionLoginForm
    Element Should be Visible       password
    Element Should be Visible       confirm-password
    Element Should be Visible       go-back

Element Message Open Login
    [Arguments]   ${Error}
    Element Text Should Be          loginErrorMessages    ${Error}
    Set Selenium Speed              0

Element Message Open Register
    [Arguments]   ${Error}
    Element Text Should Be          registerError         ${Error}
    Set Selenium Speed              0

Table Header Leaderboard
    [Arguments]   ${Criteria}
    Element Text Should Be          headerScore           ${Criteria}
    Set Selenium Speed              0

Game Lobby Page Number
    [Arguments]   ${Criteria}
    Element Text Should Be          criteriaLabel           ${Criteria}
    Set Selenium Speed              0

Element Message Open ChangePW
    [Arguments]   ${Error}
    Element Text Should Be          loginErrorMessages    ${Error}
    Set Selenium Speed              0

Element Message Open NewPW
    [Arguments]   ${Error}
    Element Text Should Be          loginErrorMessages    ${Error}
    Set Selenium Speed              0

Element Message Open Create
    [Arguments]   ${Error}
    ### Temporary
    Element Text Should Be          loginErrorMessages    ${Error}
    Set Selenium Speed              0

Create Button Enabled
    ### Temporary
    Element Should Be Enabled       btnSubmit

Create Button Disabled
    ### Temporary
    Element Should Be Disabled      btnSubmit