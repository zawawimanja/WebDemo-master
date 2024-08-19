*** Settings ***
Documentation     A test suite for login functionality.
Resource          ../page/login_page.robot

*** Variables ***


*** Test Cases ***
Valid Login
    [Setup]    Open Browser To Login Page
    Input Username    ${VALID USER}
    Input Password    ${VALID PASSWORD}
    Click Login Button
    Verify Successful Login
    [Teardown]    Close Browser


