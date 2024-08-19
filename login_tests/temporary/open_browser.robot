*** Settings ***
Resource          resource.robot

*** Test Cases ***
Open And Verify Browser
    Open Browser To Base URL
    Verify Page Title
    [Teardown]    Close Browser
