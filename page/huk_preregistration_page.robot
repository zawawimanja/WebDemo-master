*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${TAB_PRE_REGISTRATION_LOCATOR}    //a[contains(@class, 'ap-MenuItem-link') and text()='Pre-Registration']
${TAB_PRE_REGISTRATION_TEXT}       Pre-Registration


*** Keywords ***
Click Tab Pre-Registration
    Wait Until Element Is Visible    ${TAB_PRE_REGISTRATION_LOCATOR}    timeout=30s
    Element Text Should Be    ${TAB_PRE_REGISTRATION_LOCATOR}    ${TAB_PRE_REGISTRATION_TEXT}
    Click Element    ${TAB_PRE_REGISTRATION_LOCATOR}


