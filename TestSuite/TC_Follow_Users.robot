*** Settings ***
Resource    ${CURDIR}/../Resources/CommonKeywords.resource
Test Setup    Start Test
Test Teardown    Close Test

*** Variables ***
${ACCOUNT_TO_REACH}    elonmusk

*** Test Cases ***
Follow Users On Twitter
    Check And Accept Cookie Policy
    Login Twitter
    Reach Account    ${ACCOUNT_TO_REACH}
    Open Follower List
    Follow Users