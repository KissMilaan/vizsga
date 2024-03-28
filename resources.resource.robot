*** Settings ***
Library    SeleniumLibrary
Library    RequestsLibrary

*** Variables ***

#Üres értékek
${response}    ${EMPTY}
${first_name}    ${EMPTY}
${last_name}    ${EMPTY}
${email}    ${EMPTY}
${id}    ${EMPTY}
${city}    ${EMPTY}

${manufacturer}    ${EMPTY}
${model}    ${EMPTY}
${platform}    ${EMPTY}
${serial_number}    ${EMPTY}
${street_name}    ${EMPTY}
${zip_code}    ${EMPTY}
${street_address}    ${EMPTY}

#Test Def
${HOMEPAGE_URL}    https://bwpool.azurewebsites.net/
${BROWSER}    Chrome
${URL}        https://www.google.com
${DELAY_TIME}    2

#Partnerek
${PARTNEREK}    //a[contains(.,'Partnerek')]
${ADDBUTTON}    //*[@id="Grid_add"]/button
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

#Eszközök
${ESZKOZOK}    //a[contains(.,'Eszközök')]
${ADDBUTTONTREE}    //span[.='Add']
${MODEL_FIELD}    //input[@id='name']
${CUSTOMER_FIELD}    //*[@id="Grid_dialogEdit_wrapper_dialog-content"]/div/form/table/tbody/tr[3]/td/span
${CUSTOMER_ARROW}    //span[@class='e-ddl e-lib e-input-group e-control-container e-control-wrapper e-valid-input e-input-focus valid']/span[@class='e-input-group-icon e-ddl-icon e-icons e-ddl-disable-icon']
${PLATFORM_FIELD}    //textarea[@id='Desc']
${SERIALNUMB_FIELD}    //textarea[@id='Comm']
${SAVEBUTTON_ESZKOZ}    //button[@class='e-control e-btn e-lib e-control e-btn e-lib e-primary e-flat']

#Mentés
${EXCEL_EXPORT}    //span[.='Excel Export']

#Keresés grid
${SEARCH_FIELD}    //input[@id='Grid_ToolbarSearchBox']
${SEARCH_ENTER}    //span[@class='e-searchclear e-search-icon e-icons e-input-group-icon']
${STREET_URL}    xy

*** Keywords ***
Test Setup
    Open Browser    ${HOMEPAGE_URL}    ${BROWSER}
    Maximize Browser Window
    Go To   https://bwpool.azurewebsites.net/

#Api user bekeres
    ${response}    GET    https://random-data-api.com/api/users/random_user    params=size=1
    ${body}    Set Variable    ${response.json()}
    

#Json global ertekadas 
    Set Global Variable    ${first_name}    ${body}[0][first_name]
    Set Global Variable    ${last_name}    ${body}[0][last_name]
    Set Global Variable    ${email}    ${body}[0][email]
    Set Global Variable    ${id}    ${body}[0][id]
    Set Global Variable    ${city}    ${body}[0][address][city]
    Set Global Variable    ${street_name}    ${body}[0][address][street_name]
    Set Global Variable    ${zip_code}    ${body}[0][address][zip_code]
    Set Global Variable    ${street_address}    ${body}[0][address][street_address]
    Sleep    ${DELAY_TIME}s
#Api eszkoz bekeres
    ${response}    GET    https://random-data-api.com/api/device/random_device    params=size=1
    ${body_device}    Set Variable    ${response.json()}

#JSoon global ertekadas 
    Set Global Variable    ${manufacturer}    ${body_device}[0][manufacturer]
    Set Global Variable    ${model}    ${body_device}[0][model]
    Set Global Variable    ${platform}    ${body_device}[0][platform]
    Set Global Variable    ${serial_number}    ${body_device}[0][serial_number]
    Sleep    ${DELAY_TIME}s

Test Teardown
    Close Browser