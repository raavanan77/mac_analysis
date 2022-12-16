*** Settings ***
Library     SeleniumLibrary
Library    testdat.py

*** Variables ***
@{tc}=    /home/user/Downloads/pcap_logs-20221215-160122963/pcap_logs/Network_Join_Nokia_Mobile.pcap    /home/user/Downloads/pcap_logs-20221215-160122963/pcap_logs/Roaming.pcapng    /home/user/Downloads/pcap_logs-20221215-160122963/pcap_logs/rough.pcapng    /home/user/Downloads/pcap_logs-20221215-160122963/pcap_logs/all_within_network.pcapng
 

*** Keywords ***
Forloop_run
    [Arguments]    ${fname}
    Choose File    id:fileup     ${fname}
    Click Button    upload        #xpath = //*[@id="fileup"]
    Wait Until Page Contains Element    TotalManagmentFramesresult    60mins
    ${cf}=    Maccount    ${fname}
    ${result}=      Get Text  TotalManagmentFramesresult
    Should Be Equal As Integers     ${result}    ${cf[0]}
    ${result1}=      Get Text  TotalControlFramesresult
    Should Be Equal As Integers     ${result1}       ${cf[1]}
    ${result2}=      Get Text  TotalDataFramesresult
    Should Be Equal As Integers     ${result2}       ${cf[2]}

*** Test Cases ***
#Test_FORLOOP    
#    Open Browser  https://mac-analysis.onrender.com/    firefox
#    FOR  ${fn}  IN  @{tc1}
#        Forloop_run    ${fn}
#    END
    

Test_1
    Open Browser  https://mac-analysis.onrender.com/    firefox
    Forloop_run    ${tc[0]}

Test_2
    Forloop_run    ${tc[1]}


Test_3
    Forloop_run     ${tc[2]}
    