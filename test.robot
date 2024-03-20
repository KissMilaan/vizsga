*** Settings ***
Resource     resources.resource.robot


Test Setup    Test Setup

#Test Teardown    Test Teardown
*** Test Cases ***

Searching
    Click Element   ${PARTNEREK}
    Wait Until Keyword Succeeds    5s    1s    Click Element    ${ADDBUTTON}
#Api bekeres
    ${response}    GET    https://random-data-api.com/api/users/random_user    params=size=1
    ${body}    Set Variable    ${response.json()}

    # Json adatok
    ${first_name}    Set Variable    ${body}[0][first_name]
    ${last_name}     Set Variable    ${body}[0][last_name]
    ${email}         Set Variable    ${body}[0][email]
    ${id}    Set Variable    ${body}[0][id]

    # beírás mezőkbe
   # Input Text    ${NAME_FIELD}    ${first_name} ${last_name}
   # Input Text    ${EMAIL_FIELD}    ${email}
  #  Input Text    ${ID_FIELD}    ${id}