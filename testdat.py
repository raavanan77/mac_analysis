import subprocess
import re

def maccount(filename):
    count=[]
    for i in range(0,3):
        count.append(int(re.findall(r'\d+',str(subprocess.check_output(f'tshark -r {filename} -Y wlan.fc.type=={i} | wc -l',shell=True)).replace('\'',''))[0]))

    #count.append(int(re.findall(r'\d+',str(subprocess.check_output(f'tshark -r {filename} -Y wlan.fc.type==0 wlan.fc.type==1 wlan.fc.type==2 | wc -l',shell=True)).replace('\'',''))[0]))
    return (count)
