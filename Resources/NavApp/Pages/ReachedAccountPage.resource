*** Settings ***

*** Variables ***
${FOLLOWER_LIST}    //span[contains(text(), 'follower')]

*** Keywords ***
Open Follower List
    SeleniumLibrary.Wait Until Element Is Visible 	 ${FOLLOWER_LIST}
    SeleniumLibrary.Click Element 	 ${FOLLOWER_LIST}
