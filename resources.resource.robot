*** Settings ***
Library    SeleniumLibrary
Library    RequestsLibrary

*** Variables ***

${HOMEPAGE_URL}    https://bwpool.azurewebsites.net/
${BROWSER}    Chrome
${URL}        https://www.google.com

#Partnerek
${PARTNEREK}    //a[contains(.,'Partnerek')]
${ADDBUTTON}    //span[.='Add']
${NAME_FIELD}    //input[@id='name']
${EMAIL_FIELD}    //input[@id='email']
${ID_FIELD}    //input[@id='comment']
${SAVEBUTTON}    //button[@class='e-control e-btn e-lib e-control e-btn e-lib e-primary e-flat']

#Telephelyek
${TELEPHELYEK}    //a[contains(.,'Telephelyek')]
${ADDBUTTONTWO}    //span[.='Add']
${UGYFEL_FIELD}    //input[@class='e-control e-combobox e-lib e-input']
${CITY_FIELD}    //input[@id='varos']
${ZIP_FIELD}    //input[@id='zip']
${STREET_FIELD}    //input[@id='utca']
${ADRESS_FIELD}    //input[@id='szam']
${SAVEBUTTON_TELEP}    //button[@class='e-control e-btn e-lib e-control e-btn e-lib e-primary e-flat']

#Eszkozok
${ESZKOZOK}    //a[contains(.,'Eszközök')]
${ADDBUTTONTREE}    //span[.='Add']
${MODEL_FIELD}    //input[@id='name']
${CUSTOMER_FIELD}    //span[@class='e-ddl e-lib e-input-group e-control-container e-control-wrapper e-input-focus valid']/input[@class='e-control e-combobox e-lib e-input']
${PLATFORM_FIELD}    //textarea[@id='Desc']
${SERIALNUMB_FIELD}    //textarea[@id='Comm']
${SAVEBUTTON_ESZKOZ}    //button[@class='e-control e-btn e-lib e-control e-btn e-lib e-primary e-flat']

*** Keywords ***
Test Setup
    Open Browser    ${HOMEPAGE_URL}    ${BROWSER}
    Maximize Browser Window
    Go To   https://bwpool.azurewebsites.net/
    

Test Teardown
    Close Browser