*** Settings ***
Resource     resources.resource.robot


Test Setup    Test Setup

#Test Teardown    Test Teardown
*** Test Cases ***

Searching
    Click Element    ${PARTNEREK}
    Wait Until Keyword Succeeds    5s    1s    Click Element    ${ADDBUTTON}
#Api bekeres
    ${response}    GET    https://random-data-api.com/api/users/random_user    params=size=1
    ${body}    Set Variable    ${response.json()}

#Json random adatok ertekadasa
    ${first_name}    Set Variable    ${body}[0][first_name]
    ${last_name}    Set Variable    ${body}[0][last_name]
    ${email}    Set Variable    ${body}[0][email]
    ${id}    Set Variable    ${body}[0][id]
    ${city}    Set Variable    ${body}[0][city]
    ${street_name}    Set Variable    ${body}[0][street_name]
    ${zip_code}    Set Variable    ${body}[0][zip_code]
    ${street_address}    Set Variable    ${body}[0][street_adress]

# beírás mezőkbe + mentes
    Input Text    ${NAME_FIELD}    ${first_name} ${last_name}
    Input Text    ${EMAIL_FIELD}    ${email}
    Input Text    ${ID_FIELD}    ${id}
    Click Button    ${SAVEBUTTON}

#Telephelyre navigalas
    Click Element    ${TELEPHELYEK}
    Wait Until Keyword Succeeds    5s    1s    Click Element    ${ADDBUTTONTWO}

#beírás telephely mezőkbe + mentes
    Input Text    ${UGYFEL_FIELD}    ${first_name} ${last_name}
    Input Text    ${CITY_FIELD}    ${city}
    Input Text    ${ZIP_FIELD}    ${zip_code}
    Input Text    ${STREET_FIELD}    ${street_name}
    Input Text    ${ADRESS_FIELD}    ${street_address}
    Click Button    ${SAVEBUTTON_TELEP}

#Api eszkoz bekeres
    ${response}    GET    https://random-data-api.com/api/device/random_device    params=size=2
    ${body}    Set Variable    ${response.json()}

#JSoon random adatok ertekadasa
    ${manufacturer}    Set Variable    ${body}[0][manufacturer]
    ${model}    Set Variable    ${body}[0][model]
    ${platform}    Set Variable    ${body}[0][platform]
    ${serial_number}    Set Variable    ${body}[0][serial_number]

#navigalas eszkozok reszre
    Click Element    ${ESZKOZOK}
    Wait Until Keyword Succeeds    5s    1s    Click Element    ${ADDBUTTONTREE}
    
#beírás telephely mezőkbe + mentes    
    Input Text    ${MODEL_FIELD}    ${manufacturer} ${model}
    Input Text    ${CUSTOMER_FIELD}    ${first_name} ${last_name}
    Input Text    ${PLATFORM_FIELD}    ${platform}
    Input Text    ${SERIALNUMB_FIELD}    ${serial_number}
    Click Button    ${SAVEBUTTON_ESZKOZ}

