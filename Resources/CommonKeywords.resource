*** Settings ***
Library    SeleniumLibrary    timeout=30s    run_on_failure=None
Library    JSONLibrary
Resource    ${CURDIR}/Routing.resource

*** Variables ***
${LOGIN_URL}    https://twitter.com
${BROWSER}    firefox
${COOKIE_ACCEPTANCE_BUTTON}    //span[contains(text(), 'Accetta tutti i cookie')]

*** Keywords ***
Start Test
    SeleniumLibrary.Open Browser    url=${LOGIN_URL}    browser=${BROWSER}    service_log_path=${{os.path.devnull}}
    SeleniumLibrary.Maximize Browser Window

Check And Accept Cookie Policy
    ${cookieBannerPresence}    Run Keyword And Return Status    SeleniumLibrary.Wait Until Element Is Visible 	 ${COOKIE_ACCEPTANCE_BUTTON}    timeout=10s
    IF    '${cookieBannerPresence}' == 'True'
        SeleniumLibrary.Click Element 	 ${COOKIE_ACCEPTANCE_BUTTON}
    ELSE
        Log    Cookie Banner Not Found
    END


Close Test
    Close Browser