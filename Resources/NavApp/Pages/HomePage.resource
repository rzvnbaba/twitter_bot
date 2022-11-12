*** Settings ***
Resource    ${CURDIR}/../../CommonKeywords.resource

*** Variables ***
${LOGIN_BUTTON}    //span[contains(text(), 'Accedi')]
${USER_CREDENTIALS_JSON}    ${CURDIR}/../../../TestData/UserCredentials/UserCredentials.json
${USERNAME_INPUT}    //input[@autocomplete="username"]
${NEXT_BUTTON}    //span[contains(text(), 'Avanti')]
${PASSWORD_INPUT}    //input[@name="password"]
${HOME_LABEL}    (//span[contains(text(), 'Home')])[1]

*** Keywords ***
Login Twitter
    SeleniumLibrary.Wait Until Element Is Visible 	 ${LOGIN_BUTTON}
    SeleniumLibrary.Click Element 	 ${LOGIN_BUTTON}
    ${user}    Load And Insert    user
    SeleniumLibrary.Wait Until Element Is Visible 	 ${USERNAME_INPUT}
    SeleniumLibrary.Input Text 	 ${USERNAME_INPUT}    ${user}
    SeleniumLibrary.Wait Until Element Is Visible 	 ${NEXT_BUTTON}
    SeleniumLibrary.Click Element 	 ${NEXT_BUTTON}
    ${password}    Load And Insert    password
    SeleniumLibrary.Wait Until Element Is Visible 	 ${PASSWORD_INPUT}
    SeleniumLibrary.Input Text 	 ${PASSWORD_INPUT}    ${password}
    SeleniumLibrary.Wait Until Element Is Visible 	 (${LOGIN_BUTTON})[2]
    SeleniumLibrary.Click Element 	 (${LOGIN_BUTTON})[2]
    SeleniumLibrary.Wait Until Element Is Visible 	 ${HOME_LABEL}

Load And Insert
    [Arguments]    ${dataToLoad}
    ${textToInput}  Load Data From Json    ${dataToLoad}
    [Return]    ${textToInput}

Load Data From Json
    [Arguments]    ${dataType}
    ${jsonContent}    Load Json From File    ${USER_CREDENTIALS_JSON}
    IF    '${dataType}' == 'user'
        ${data}    Get Value From Json    ${jsonContent}    $.user
    ELSE IF    '${dataType}' == 'password'
        ${data}    Get Value From Json    ${jsonContent}    $.password
    END
    [Return]    ${data}[0]

Reach Account
    [Arguments]    ${accountToReach}
    SeleniumLibrary.Go To 	 https://twitter.com/${accountToReach}