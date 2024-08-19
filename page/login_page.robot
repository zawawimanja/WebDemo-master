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
${USERNAME_TEXT}    //label[@for='username-email']
${PASSWORD_TEXT}    //label[@for='password']
${HOMEPAGE_HEADING_LOCATOR}    //h2[@class='heading'] 
${TAB_HOME}            //a[contains(@class, 'ap-MenuItem-link') and text()='Home']

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${LOGIN_URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Login Page Should Be Open

Login Page Should Be Open
    Title Should Be    NXOne - Sign In using your Domain Username Password

Input Username
    Wait Until Element Is Visible    ${USERNAME_TEXT} 
    Element Text Should Be    ${USERNAME_TEXT}    User Name
    [Arguments]    ${username}
    Input Text    ${USERNAME_FIELD}    ${username}

Input Password
    Wait Until Element Is Visible    ${PASSWORD_TEXT} 
    Element Text Should Be    ${PASSWORD_TEXT}    Password
    [Arguments]    ${password}
    Input Text    ${PASSWORD_FIELD}    ${password}

Click Login Button
    Click Button    ${LOGIN_BUTTON}

Verify Successful Login
    Wait Until Page Contains   Welcome
    Wait Until Element Is Visible    ${TAB_HOME}    timeout=30s
    Element Text Should Be    ${TAB_HOME}    Home

Login Should Fail
    Location Should Be    ${ERROR_URL}
    Title Should Be    Error Page

Valid Login
    [Setup]    Open Browser To Login Page
    Input Username    ${VALID_USER}
    Input Password    ${VALID_PASSWORD}
    Click Login Button
    Verify Successful Login   
