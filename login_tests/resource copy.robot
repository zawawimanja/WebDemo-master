*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.
Library           SeleniumLibrary
*** Settings ***

*** Variables ***
${SERVER}              opensource-demo.orangehrmlive.com/web/index.php/
${BROWSER}             Chrome
${DELAY}               0
${VALID USER}          Admin
${VALID PASSWORD}      admin123
${LOGIN URL}           http://${SERVER}/auth/login
${WELCOME URL}         http://${SERVER}/dashboard/index
${ERROR URL}           http://${SERVER}/error.html
${LOGIN PAGE_CLASS}    css:.orangehrm-login-title
${DASHBOARD PAGE_CLASS}    css:.oxd-topbar-header-breadcrumb-module
${BUTTON LOGIN_CLASS}  css:.orangehrm-login-button

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Login Page Should Be Open

Login Page Should Be Open
    Element Text Should Be    ${LOGIN PAGE_CLASS}    Login

Input Username
    [Arguments]    ${username}
    Input Text    username_field    ${username}

Input Password
    [Arguments]    ${password}
    Input Text    password_field    ${password}

Submit Credentials
    Click Button    ${BUTTON LOGIN_CLASS}

Dashboard Page Should Be Open
    Element Text Should Be    ${DASHBOARD PAGE_CLASS}   Dashboard

