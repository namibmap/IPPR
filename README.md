

# Prerequisites
* This framework requires a good understanding of node.js, geo.json, CartoDB
* Install node.js

# Before you start
* Download files into a directory
* From the application home directory, run ```npm install```
* Download the file ```secret.js``` from the email  @raquel-ucl sent (Subject of the email is "**Accounts**")
* Copy the file ```secret.js``` into the parent IPPR folder, in the same location where ```server.js``` is located

# Setup cronjob on server
* This is setup to pull data from the flexicadastre
* 00 00 * * * /home/dev/git/IPPR/utils/SyncFlexicadastre.sh

# Running the app
* Run ```npm start```
* Open ```http://<ip-address-of-server>:3000``` in your web browser
