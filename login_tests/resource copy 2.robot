*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${BROWSER}        Chrome
${BASE_URL}       http://yahoo.com

*** Keywords ***
Open Browser To Base URL
    Open Browser    ${BASE_URL}    ${BROWSER}
    Maximize Browser Window

Verify Page Title
    ${title}=    Get Title
     Log To Console    The page title is: ${title}
