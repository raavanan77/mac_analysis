*** Settings ***
Library     SeleniumLibrary
Library    testdat.py

*** Variables ***
${tc1}                 #=    /home/user/Downloads/ecobee3pcap_randomized.pcap
${tc2} 
*** Test Cases ***
Test_1    

    Open Browser  https://mac-analysis.onrender.com/    firefox
    #Click Button    xpath = //input[@type='file']
    Choose File    id:fileup     ${tc1}
    Click Button    upload        #xpath = //*[@id="fileup"]
    Wait Until Page Contains Element    TotalManagmentFramesresult    60mins
    ${cf}=    Maccount    ${tc1}
    ${result}=      Get Text  TotalManagmentFramesresult
    Should Be Equal As Integers     ${result}    ${cf[0]}
    ${result1}=      Get Text  TotalControlFramesresult
    Should Be Equal As Integers     ${result1}       ${cf[1]}
    ${result2}=      Get Text  TotalDataFramesresult
    Should Be Equal As Integers     ${result2}       ${cf[2]}

Test_2

    ${result}=      Get Text  TotalControlFramesresult
    Should Be Equal As Integers     ${result}       901


Test_3

    ${result}=      Get Text  TotalDataFramesresult
    Should Be Equal As Integers     ${result}       46

Test_4                 # wired Pcap test 

    #Click Button        xpath = //*[@id="fileup"]            
    Choose File         id:fileup     /home/user/Downloads/wired3.pcap
    Click Button        xpath = /html/body/form/div[1]/div/div/div/button
    ${result}=      Get Text  TotalManagmentFramesresult
    Should Be Equal As Strings     ${result}       0

Test_5
    
    #Choose File         id:fileup     /home/user/Desktop/dhcp/dhcp2.pcapng
    #Click Button        xpath = /html/body/form/div[1]/div/div/div/button
    ${result}=      Get Text  TotalControlFramesresult
    Should Be Equal As Strings     ${result}       0

Test_6

    #Choose File         id:fileup     /home/user/Desktop/dhcp/dhcp2.pcapng
    #Click Button        xpath = /html/body/form/div[1]/div/div/div/button
    ${result}=      Get Text  TotalDataFramesresult
    Should Be Equal As Strings     ${result}       0


Test_7             # empty pcap
    
    Choose File         id:fileup     /home/user/Desktop/dhcp/dhcp2.pcapng
    Click Button        xpath = /html/body/form/div[1]/div/div/div/button
    ${result}=      Get Text  TotalManagmentFramesresult
    Should Be Equal As Strings     ${result}       0
Test_8
    
    #Choose File         id:fileup     /home/user/Desktop/dhcp/dhcp2.pcapng
    #Click Button        xpath = /html/body/form/div[1]/div/div/div/button
    ${result}=      Get Text  TotalControlFramesresult
    Should Be Equal As Strings     ${result}       0


Test_9

    #Choose File         id:fileup     /home/user/Desktop/dhcp/dhcp2.pcapng
    #Click Button        xpath = /html/body/form/div[1]/div/div/div/button
    ${result}=      Get Text  TotalDataFramesresult
    Should Be Equal As Strings     ${result}       0


    



#Test_10                 #other format test
#
#    Choose File         id:fileup     /home/user/Downloads/avb-gs-802-11-qos-tutorial-1108.pdf
#    Click Button        xpath = /html/body/form/div[1]/div/div/div/button
#           
#
#Test_11                    # image format test
#
#    Choose File         id:fileup     /home/user/Downloads/Screenshot.png
#    Click Button        xpath = /html/body/form/div[1]/div/div/div/button
#
#    
     
