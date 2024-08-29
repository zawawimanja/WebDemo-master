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
${HOMEPAGE_TEXT} =  css=h2.heading
${PREREG_LINK} =  (//a[contains(@class, 'ap-MenuItem-link link-49')])[2]


        

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

Verify PreregTab Text
    Wait Until Page Contains    Pre-Registration    timeout=30s
    Wait Until Element Is Visible    ${PREREG_LINK}    timeout=30s
    Element Text Should Be           ${PREREG_LINK}    Pre-Registration

Click PreregTab
    Click Element    ${PREREG_LINK}    

Wait For Center Component
    [Documentation]    Wait for the center component to be visible and interactable
    ${extended_timeout}=    Set Variable    60s
    ${element_id}=    Set Variable    formPreview

    FOR    ${index}    IN RANGE    1    5
        Log    Attempt ${index}: Trying to find and make the center component visible

        # Check if the element exists
        ${element_exists}=    Execute JavaScript    return document.querySelector('#${element_id}') !== null;

        # Only focus and scroll if the element exists
        Run Keyword If    '${element_exists}'=='True'    Focus And Scroll Element    ${element_id}

        # Wait until the element is visible
        Run Keyword And Ignore Error    Wait Until Element Is Visible    id=${element_id}    timeout=${extended_timeout}

        # Check if the element is now visible
        ${element_visible}=    Run Keyword And Return Status    Wait Until Element Is Visible    id=${element_id}    timeout=5s
        Run Keyword If    '${element_visible}'=='True'    Exit For Loop

        Log    Element not found or still not visible on attempt ${index}. Retrying...

        Run Keyword If    '${index}'=='4' and '${element_visible}'=='False'    Fail    Element 'id=${element_id}' did not appear after several retries
    END





Wait For Left Component
    FOR    ${index}    IN RANGE    1    5
        Wait Until Page Contains Element    class=ap-Menu-Items     timeout=15s
        Wait Until Element Is Visible       class=ap-Menu-Items     timeout=60s
        Run Keyword If    '${index}'=='4'    Fail    Element not found after several retries
    END

Focus And Scroll Element
    [Documentation]    Ensure the element is in view and visible
    [Arguments]    ${element_id}

    # Force a hover or focus action on the element
    Execute JavaScript    var el = document.querySelector('#${element_id}'); if (el) { el.focus(); el.scrollIntoView(); el.style.display = 'block'; }


   
    
