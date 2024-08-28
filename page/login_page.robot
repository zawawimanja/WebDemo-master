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
${HOMEPAGE_HEADING_LOCATOR}    xpath=//h2[@data-i18n='translation:FormSettings.Title']
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
   
   
Verify Home Page Heading 
    Wait Until Keyword Succeeds    5x    10s    Execute Javascript    return document.readyState == 'complete';
    Sleep    5s
    Capture Page Screenshot

    # Check if any h2 elements are found
    ${element_count}=    Execute Javascript    return document.querySelectorAll('h2').length;
    Log    Number of h2 elements found: ${element_count}
    Should Be True    ${element_count} > 0

    # Check specifically for h2.heading elements
    ${heading_exists}=    Execute Javascript    return document.querySelector('h2.heading') != null;
    Log    Element found: ${heading_exists}
    Should Be True    ${heading_exists}

    # Check if the display property is hiding the element
    ${element_display}=    Execute Javascript    return window.getComputedStyle(document.querySelector('h2.heading')).display;
    Log    Element display property: ${element_display}
    Should Not Be Equal    ${element_display}    none

    # Proceed with the regular validation
    Wait Until Page Contains Element    ${HOMEPAGE_HEADING_LOCATOR}    timeout=60s
    Scroll Element Into View    ${HOMEPAGE_HEADING_LOCATOR}
    Element Text Should Be    ${HOMEPAGE_HEADING_LOCATOR}    Home Page

Valid Login
    [Setup]    Open Browser To Login Page
    Input Username    ${VALID_USER}
    Input Password    ${VALID_PASSWORD}
    Click Login Button
    Verify Successful Login  
    Verify Home Page Heading 
