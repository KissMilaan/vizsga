*** Settings ***
Resource     resources.resource.robot


Test Setup    Test Setup
Test Teardown    Test Teardown

*** Test Cases ***

Searching
    Click Element    ${PARTNEREK}
    Wait Until Keyword Succeeds    5s    1s    Click Element    ${ADDBUTTON}

# beírás mezőkbe
    Input Text    ${NAME_FIELD}    ${first_name} ${last_name}
    Input Text    ${EMAIL_FIELD}    ${email}
    Input Text    ${ID_FIELD}    ${id}
    Click Button    ${SAVEBUTTON}

Telephely
#Telephelyre navigalas
    Click Element    ${TELEPHELYEK}
    Wait Until Keyword Succeeds    5s    1s    Click Element    ${ADDBUTTONTWO}

#beírás telephely mezőkbe
    Input Text    ${UGYFEL_FIELD}    ${first_name} ${last_name}
    Input Text    ${CITY_FIELD}    ${city}
    Input Text    ${ZIP_FIELD}    ${zip_code}
    Input Text    ${STREET_FIELD}    ${street_name}
    Input Text    ${ADRESS_FIELD}    ${street_address}
    Click Button    ${SAVEBUTTON_TELEP}

Eszkozok
#Eszkozok navigalas
    Click Element    ${ESZKOZOK}
    Wait Until Keyword Succeeds    5s    1s    Click Element    ${ADDBUTTONTREE}

#beiras
    Input Text    ${MODEL_FIELD}    ${manufacturer} ${model}
    Input Text    ${CUSTOMER_FIELD}    ${first_name} ${last_name}
    Input Text    ${PLATFORM_FIELD}    ${platform}
    Input Text    ${SERIALNUMB_FIELD}    ${serial_number}
    Click Button    ${SAVEBUTTON_ESZKOZ}

#mentés
    Click Element    ${EXCEL_EXPORT}
    Press Keys    None    ENTER

#Telephelyekre vissza
    Click Element    ${TELEPHELYEK}
    Wait Until Keyword Succeeds    5s    1s    Input Text    ${SEARCH_FIELD}    ${first_name} ${last_name}
    Click Element    ${SEARCH_ENTER}
    Click Element    ${STREET_URL}