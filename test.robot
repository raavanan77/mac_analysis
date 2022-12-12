*** Settings ***
Library     SeleniumLibrary

*** Test Cases ***
1 Test Add
    Open Browser  http://127.0.0.1:5000/    firefox
    #Click Button    xpath = //input[@type='file']
    Choose File    id:fileup     /home/evvi/mac_analysis/static/all_within_network.pcapng
    Click Button    upload
    Wait Until Page Contains Element    TotalManagmentFramesresult    60mins
    ${result}=      Get Text  TotalManagmentFramesresult
    Should Be Equal As Strings     ${result}       16362
    Close Browser        