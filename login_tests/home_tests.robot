*** Settings ***
Documentation     A test suite for login functionality.
Resource          ../page/login_page.robot
Resource          ../page/home_page.robot


*** Variables ***


*** Test Cases ***
Valid HomePage Test Case
    Valid Login
    Verify Homepage Text
    [Teardown]    Close Browser


