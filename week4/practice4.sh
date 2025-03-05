#!/bin/bash

name="$(whoami)"

sudo useradd practiceFour -p 1q2w3e
if [[ $? -ne 0 ]]; then
   echo "Couldn't create user"
   exit 1
fi
sudo groupadd coolGroup
sudo usermod -aG coolGroup practiceFour
sudo usermod -aG coolGroup $name
mkdir test
sudo chown practiceFour:coolGroup test
cd test
sudo touch 1.txt 2.txt 3.txt
echo "1txt" | sudo tee -a 1.txt &>/dev/null
echo "2txt" | sudo tee -a 2.txt &>/dev/null
echo "3txt" | sudo tee -a 3.txt &>/dev/null
sudo mkdir dir
cd dir
sudo touch test.sh
echo <<< EOL
#!/bin/bash

echo 'hello world'
EOL | sudo tee -a test.sh &>/dev/null
sudo chmod g+x test.sh
cd ../..
sudo chown -R practiceFour:coolGroup test
sudo ln -s test/dir test/dir_link
exit 0