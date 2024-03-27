*** Settings ***
Resource     resources.resource.robot


Test Setup    Test Setup
Test Teardown    Test Teardown

*** Test Cases ***

Searching
    Click Element    ${PARTNEREK}
    Sleep    4s
    Mouse Over    ${ADDBUTTON}
    Sleep    2s
    Press Keys    ${ADDBUTTON}    \\
    Sleep    1s

# Beírás mezőkbe
    Input Text    ${NAME_FIELD}    ${first_name} ${last_name}
    Input Text    ${EMAIL_FIELD}    ${email}
    Input Text    ${ID_FIELD}    ${id}
    Click Button    ${SAVEBUTTON}

Telephelyek

#Telephelyre navigalas
    Click Element    ${TELEPHELYEK}
    Sleep    4s
    Mouse Over    ${ADDBUTTONTWO}
    Sleep    2s
    Press Keys    ${ADDBUTTONTWO}    \\
    Sleep    1s

#Beírás telephely mezőkbe
    Input Text    ${UGYFEL_FIELD}    ${first_name} ${last_name}
    Input Text    ${CITY_FIELD}    ${city}
    Input Text    ${ZIP_FIELD}    ${zip_code}
    Input Text    ${STREET_FIELD}    ${street_name}
    Input Text    ${ADRESS_FIELD}    ${street_address}
    Click Button    ${SAVEBUTTON_TELEP}

Eszkozok

#Eszközök navigálás
    Click Element    ${ESZKOZOK}
    Sleep    4s
    Mouse Over    ${ADDBUTTONTREE}
    Sleep    2s
    Press Keys    ${ADDBUTTONTREE}    \\
    Sleep    1s

#Beírás Eszközök mezőkbe
    Input Text    ${MODEL_FIELD}    ${manufacturer} ${model}
    Mouse Over    ${CUSTOMER_ARROW}
    Sleep    2s
    Press Keys    ${CUSTOMER_ARROW}    \\
    Sleep    1s
    Select From List By Value    ${CUSTOMER_ARROW}    ${first_name} ${last_name}
    Sleep    1s
    Input Text    ${SERIALNUMB_FIELD}    ${serial_number}
    Click Button    ${SAVEBUTTON_ESZKOZ}

Last Steps
#Mentés
    Click Element    ${PARTNEREK}
    Wait Until Keyword Succeeds    5s    1s    Click Element    ${EXCEL_EXPORT}
    Press Keys    None    ENTER

#Telephelyekre vissza
    Click Element    ${TELEPHELYEK}
    Wait Until Keyword Succeeds    5x    1s    Input Text    ${SEARCH_FIELD}    ${first_name} ${last_name}
    Click Element    ${SEARCH_ENTER}
    Click Element    ${STREET_URL}