*** Settings ***
Resource    ${CURDIR}/../Resources/CommonKeywords.resource
Test Setup    Start Test
#Test Teardown    Close Test

*** Variables ***

*** Test Cases ***
Follow Users On Twitter
    Check And Accept Cookie Policy
    Login Twitter