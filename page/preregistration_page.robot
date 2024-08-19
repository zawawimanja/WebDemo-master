*** Settings ***
Library    SeleniumLibrary

*** Variables ***

${LOGIN_BUTTON}    css:.primaryAction.signin-button

*** Keywords ***


Verify Successful Click Pre-Registration
    Wait Until Page Contains    Pre-Registration
    Page Should Contain    Pre-Registration


