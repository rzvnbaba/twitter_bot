*** Settings ***
Resource    ${CURDIR}/../../CommonKeywords.resource

*** Variables ***
${LOGIN_BUTTON}    //span[contains(text(), 'Accedi')]
${USER_CREDENTIALS_JSON}    ${CURDIR}/../../../TestData/UserCredentials/UserCredentials.json
${USERNAME_INPUT}    //input[@autocomplete="username"]
${NEXT_BUTTON}    //span[contains(text(), 'Avanti')]

*** Keywords ***
Login Twitter
    SeleniumLibrary.Wait Until Element Is Visible 	 ${LOGIN_BUTTON}
    SeleniumLibrary.Click Element 	 ${LOGIN_BUTTON}
    ${user}    Load And Insert    user
    SeleniumLibrary.Wait Until Element Is Visible 	 ${USERNAME_INPUT}
    SeleniumLibrary.Input Text 	 ${USERNAME_INPUT}    ${user}
    SeleniumLibrary.Wait Until Element Is Visible 	 ${NEXT_BUTTON}
    SeleniumLibrary.Click Element 	 ${NEXT_BUTTON}

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
