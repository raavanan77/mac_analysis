#!/bin/bash

sudo apt-get install -y tshark
cd ~./Downloads 
mkdir mac
cd mac
pip install virtualenv
virtualenv env
source env/bin/activate
mv ~./Downloads/mac_analysis-master ~./Downloads/mac
cd mac_analysis-master
pip install -r requirements.txt