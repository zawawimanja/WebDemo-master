*** Settings ***
Documentation     A test suite for login functionality.
Resource          ../page/login_page.robot
Resource          ../page/preregistration_page.robot

*** Variables ***


*** Test Cases ***
Valid Pre-Registration
    Valid Login
    Click Tab Pre-Registration 
    [Teardown]    Close Browser


