*** Settings ***
Library     SeleniumLibrary

*** Test Cases ***
Test 1
    Open Browser  https://mac-analysis.onrender.com/    firefox
    #Click Button    xpath = //input[@type='file']
    Choose File    id:fileup     /home/evvi/Downloads/pcap_logs-20221212-114816101/pcap_logs/Network_Join_Nokia_Mobile.pcap
    Click Button    upload
    Wait Until Page Contains Element    TotalManagmentFramesresult    60mins
    ${result}=      Get Text  TotalManagmentFramesresult
    Should Be Equal As Strings     ${result}       698

Test 2
    #Open Browser  https://mac-analysis.onrender.com/    firefox
    #Click Button    xpath = //input[@type='file']
    Choose File    id:fileup     /home/evvi/Downloads/pcap_logs-20221212-114816101/pcap_logs/rough.pcapng
    Click Button    upload
    Wait Until Page Contains Element    TotalManagmentFramesresult    60mins
    ${result}=      Get Text  TotalManagmentFramesresult
    Should Be Equal As Strings     ${result}       914
    Close Browser