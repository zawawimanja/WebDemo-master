*** Settings ***
Documentation     A test suite for login functionality.
Resource          ../page/login_page.robot
Resource          ../page/home_page.robot
Resource          ../page/preregistration_page.robot


*** Variables ***


*** Test Cases ***
Valid PreregistrationPage Test Case
    Valid Login
    Verify PreregTab Text
  
    Wait For Center Component
    Click PreregTab 
    Verify NoticeType Text



