*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${TAB_PRE_REGISTRATION_LOCATOR}    //a[contains(@class, 'ap-MenuItem-link') and text()='Pre-Registration']
${TAB_PRE_REGISTRATION_TEXT}       Pre-Registration
${NOTICE_TYPE_SELECT}    id=NoticeTypePreReg


*** Keywords ***
Click Tab Pre-Registration
    Wait Until Element Is Visible    ${TAB_PRE_REGISTRATION_LOCATOR}    timeout=30s
    Element Text Should Be    ${TAB_PRE_REGISTRATION_LOCATOR}    ${TAB_PRE_REGISTRATION_TEXT}
    Click Element    ${TAB_PRE_REGISTRATION_LOCATOR}

Select And Verify Notice Type
    [Arguments]    ${option}
    Wait Until Element Is Visible    ${NOTICE_TYPE_SELECT}    timeout=10s
    Select From List By Label        ${NOTICE_TYPE_SELECT}    ${option}
    ${selected_option}=    Get Selected List Label    ${NOTICE_TYPE_SELECT}
    Should Be Equal As Strings       ${selected_option}    ${option}