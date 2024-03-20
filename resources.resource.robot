*** Settings ***
Library    SeleniumLibrary
Library    RequestsLibrary

*** Variables ***

${HOMEPAGE_URL}    https://bwpool.azurewebsites.net/
${PARTNEREK}    //a[contains(.,'Partnerek')]
${BROWSER}    Chrome
${URL}        https://www.google.com
${ADDBUTTON}    //span[.='Add']
${NAME_FIELD}    /html/body/div[3]/div[1]/div[2]/div/form/table/tbody/tr[1]/td/div/input
${EMAIL_FIELD}    //input[@id='email']
${ID_FIELD}    //input[@id='comment']

*** Keywords ***
Test Setup
    Open Browser    ${HOMEPAGE_URL}    ${BROWSER}
    Maximize Browser Window
    Go To   https://bwpool.azurewebsites.net/
    

Test Teardown
    Close Browser