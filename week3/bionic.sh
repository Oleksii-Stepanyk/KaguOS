#!/bin/bash

top -b -n 1 | sudo tee -a /etc/temp.txt >/dev/null
shuf -n 1 /etc/temp.txt | sudo tee -a /etc/bionic.txt >/dev/null
