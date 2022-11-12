*** Settings ***

*** Variables ***
${FOLLOW_BUTTON}    (//span[contains(text(), 'Segui')])[1]
${SCROLL_GAP}    50

*** Keywords ***
Follow Users
    FOR    ${index}    IN RANGE    400
        ${followerToFollow}    Run Keyword And Return Status   SeleniumLibrary.Wait Until Element Is Visible 	 ${FOLLOW_BUTTON}
        Sleep    30s
        IF    '${followerToFollow}' == 'True'
            SeleniumLibrary.Click Element 	 ${FOLLOW_BUTTON}
        ELSE
            ${start}    Evaluate    ${index} * ${SCROLL_GAP}
            ${end}    Evaluate    ${index} * ${SCROLL_GAP} + ${SCROLL_GAP}
            SeleniumLibrary.Execute Javascript 	 window.scrollTo(${start}, ${end})
        END
        Sleep    30s
    END
