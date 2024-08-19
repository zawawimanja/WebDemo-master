*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${SERVER}          barista-uat.perkeso.gov.my:13491/
${BROWSER}         Chrome
${DELAY}           0
${VALID_USER}      uat_norazrin
${VALID_PASSWORD}  u@T_norazrin
${LOGIN_URL}       http://${SERVER}/login
${WELCOME_URL}     http://${SERVER}/home
${ERROR_URL}       http://${SERVER}/error.html
${USERNAME_FIELD}  id=username-email
${PASSWORD_FIELD}  id=password
${LOGIN_BUTTON}    css:.primaryAction.signin-button

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Login Page Should Be Open

Login Page Should Be Open
    Title Should Be    NXOne - Sign In using your Domain Username Password

Input Username
    [Arguments]    ${username}
    Input Text    ${USERNAME_FIELD}    ${username}

Input Password
    [Arguments]    ${password}
    Input Text    ${PASSWORD_FIELD}    ${password}

Click Login Button
    Click Button    ${LOGIN_BUTTON}

Verify Successful Login
     Wait Until Page Contains    Homepage
    Page Should Contain    Homepage

Login Should Fail
    Location Should Be    ${ERROR URL}
    Title Should Be    Error Page
