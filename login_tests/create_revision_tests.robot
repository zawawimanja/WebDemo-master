*** Settings ***
Documentation     A test suite for login functionality.
Resource          ../page/login_page.robot

*** Variables ***


*** Test Cases ***
Valid Login Test Case
    Valid Login
    [Teardown]    Close Browser


