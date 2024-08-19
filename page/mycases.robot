*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${TAB_MYCASES_LOCATOR}    //a[contains(@class, 'ap-MenuItem-link') and text()='MyCases']
${TAB_MYCASES_TEXT}       MyCases

*** Keywords ***

Click Tab MyCases
    Wait Until Element Is Visible    ${TAB_MYCASES_LOCATOR}    timeout=30s
    Element Text Should Be    ${TAB_MYCASES_LOCATOR}    ${TAB_PRE_REGISTRATION_TEXT}
    Click Element    ${TAB_MYCASES_LOCATOR}