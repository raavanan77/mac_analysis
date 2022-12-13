import os
import pandas as pd

def macAnalysis(filename):
    try:
        os.system(f'tshark -r {os.getcwd()}/{filename} -T fields -e wlan.fc.type -e wlan.fc.subtype -E header=y -E separator=, -E quote=d -E occurrence=f > {os.getcwd()}/mac.csv')
        mgt =  "Total Managment Frames : "
        ctrl = "Total Control Frames   : "
        data = "Total Data Frames      : "
        #st_mgt =  "Total Subtype Managment Frames : "
        #st_ctrl = "Total Subtype Control Frames   : "
        #st_data = "Total Subtype Data Frames      : "
        mac = (pd.read_csv('mac.csv').groupby(['wlan.fc.type']))
        #st_mac = (pd.read_csv('mac.csv').groupby(['wlan.fc.type']))
        try:mgt += str(mac.groups[0].size)#;st_mgt += str(mac.groups[0].size)
        except:mgt += str(0)#;st_mgt += str(0)
        try:ctrl += str(mac.groups[1].size)#;st_ctrl += str(mac.groups[1].size)
        except:ctrl += str(0)#;st_ctrl += str(0)
        try:data += str(mac.groups[2].size)#;st_data += str(mac.groups[2].size)
        except:data += str(0)#;st_data += str(0)
    except:
        return ['Uploaded file contains no 802.11 frames']
    return [mgt,ctrl,data]