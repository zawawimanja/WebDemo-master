*** Settings ***
Documentation     A test suite for login functionality.
Resource          ../page/login_page.robot
Resource          ../component/left-sidebar.robot

*** Variables ***


*** Test Cases ***
Valid Pre-Registration
    Valid Login
    Click Tab Pre-Registration 
    Verify Tab Page  Pre-Registration 
    [Teardown]    Close Browser


