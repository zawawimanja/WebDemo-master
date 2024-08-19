*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${TAB_PRE_REGISTRATION_LOCATOR}    //a[contains(@class, 'ap-MenuItem-link') and text()='Pre-Registration']
${HOMEPAGE_HEADING_LOCATOR}    //h2[@class='heading']
${PASSWORD_TEXT}    //label[@for='password']
${TAB_PRE_REGISTRATION_TEXT}   Pre-Registration

*** Keywords ***
Click Tab Pre-Registration
 
   
    Wait Until Element Is Visible    ${TAB_PRE_REGISTRATION_LOCATOR}    timeout=30s
    Element Text Should Be    ${TAB_PRE_REGISTRATION_LOCATOR}   Pre-Registration
    Click Element    ${TAB_PRE_REGISTRATION_LOCATOR}



Verify Tab Page
    [Arguments]    ${TAB_PRE_REGISTRATION_TEXT}
    Page Should Contain    ${TAB_PRE_REGISTRATION_TEXT}