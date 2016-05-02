Behat
=====


Intallation and execution
=========================

To get the selenium server and the chrome driver, just run the install script like this:
1. ./install.sh mac   => for mac based laptops
2. ./install.sh linux => for linux based laptops


To do it manually you should:


Setup Behat for Firefox (default)
==============================

1. Get the selenium standalone server from here:
http://goo.gl/IHP6Qw

2. Rename it to selenium-server-standalone-2.53.0.jar if needed.



Run Behat in Chrome
===================

1. Download the Chrome driver from here:
Linux: http://chromedriver.storage.googleapis.com/2.21/chromedriver_linux64.zip <br>
MacOs: http://chromedriver.storage.googleapis.com/2.21/chromedriver_mac32.zip

2. Extract the driver and move the file to the Behat root folder:
E.g. ~/projects/behat (this is the recommender install location)

3. Get the selenium standalone server from here:
http://goo.gl/IHP6Qw

4. Rename it to selenium-server-standalone-2.53.0.jar if needed.

5. Extract the server and move the file to the Behat root folder:
E.g. ~/projects/behat (this is the recommended install location)

6. Match the behat.yml file should to this:
default: <br>
  extensions: <br>
    Behat\MinkExtension\Extension: <br>
      base_url: localhost:8000 <br>
      browser_name: chrome <br>
      goutte: ~ <br>
      selenium2: ~ <br>


Start the selenium standalone
========================================
1. For firefox:
java -jar selenium-server-standalone-2.40.0.jar
2. For chrome
java -jar selenium-server-standalone-2.40.0.jar -Dwebdriver.chrome.driver=chromedriver