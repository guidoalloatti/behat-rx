Behat
=====

Run Behat in Firefox (default)
==============================

1. Get the selenium standalone server from here:
http://goo.gl/IHP6Qw

2. The selenium standalone should be started like this:
java -jar selenium-server-standalone-2.40.0.jar


Run Behat in Chrome
===================

1. Download the Chrome driver from here:
Linux: http://chromedriver.storage.googleapis.com/2.21/chromedriver_linux64.zip <br>
MacOs: http://chromedriver.storage.googleapis.com/2.21/chromedriver_mac32.zip

2. Extract the driver and move the file to the Behat root folder:
E.g. ~/projects/behat (this is the recommender install location)

3. Get the selenium standalone server from here:
http://goo.gl/IHP6Qw

4. Extract the server and move the file to the Behat root folder:
E.g. ~/projects/behat (this is the recommender install location)

5. Start the selenium standalone server like this:
java -jar selenium-server-standalone-2.40.0.jar -Dwebdriver.chrome.driver=chromedriver

6. Match the behat.yml file should to this:
default: <br>
  extensions: <br>
    Behat\MinkExtension\Extension: <br>
      base_url: localhost:8000 <br>
      browser_name: chrome <br>
      goutte: ~ <br>
      selenium2: ~ <br>