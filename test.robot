*** Settings ***
Resource     resources.resource.robot


Suite Setup    Suite Setup
Suite Teardown    Suite Teardown  

*** Test Cases ***

Searching
#Partnerek
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
    Sleep    4s
    Press Keys    ${ADDBUTTONTREE}    \\
    Sleep    4s

#Beírás Eszközök mezőkbe
    Input Text    ${MODEL_FIELD}    ${manufacturer} ${model}
    Sleep    1s
    Click Element    ${CUSTOMER_ARROW}
    Sleep    2s
    Wait Until Element Is Visible    //li[.='${DROPDOWN_FULLNAME}']    timeout=10s
    Click Element    //li[.='${DROPDOWN_FULLNAME}']
    Input Text    ${PLATFORM_FIELD}    ${platform}
    Input Text    ${SERIALNUMB_FIELD}    ${serial_number}
    Click Button    ${SAVEBUTTON_ESZKOZ}

Last Steps
#Mentés
    Click Element    ${PARTNEREK}
    Sleep    4s
    Mouse Over    ${EXCEL_EXPORT}
    Sleep    2s
    Press Keys    ${EXCEL_EXPORT}    \\
    Sleep    1s
    Press Keys    None    ENTER

#Telephelyekre vissza
    Click Element    ${TELEPHELYEK}
    Wait Until Keyword Succeeds    5x    1s    Input Text    ${SEARCH_FIELD}    ${DROPDOWN_FULLNAME}
    Click Element    ${SEARCH_ENTER}
    Wait Until Keyword Succeeds    5x    1s    Click Element    ${STREET_URL}
    