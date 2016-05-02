Behat
=====


Intallation and execution
=========================

To get the selenium server and the chrome driver, just run the install script like this:
* Mac based
<blockquote>
./install.sh mac
</blockquote>

* Linux based
<blockquote>
./install.sh linux
</blockquote>


# To do it manually you should:


Manual Setup Behat for Firefox (default)
========================================

* Get the selenium standalone server from here:
<blockquote>
http://goo.gl/IHP6Qw
</blockquote>
* Rename it to selenium-server-standalone-2.53.0.jar if needed.


Manual Setup for Chrome
=======================

1. Download the Chrome driver from here:
<blockquote>
Linux: http://chromedriver.storage.googleapis.com/2.21/chromedriver_linux64.zip <br>
MacOs: http://chromedriver.storage.googleapis.com/2.21/chromedriver_mac32.zip
</blockquote>

2. Extract the driver and move the file to the Behat root folder:
<blockquote>
E.g. ~/projects/behat (this is the recommender install location)
</blockquote>

3. Get the selenium standalone server from here:
<blockquote>
http://goo.gl/IHP6Qw
</blockquote>

4. Rename it to selenium-server-standalone-2.53.0.jar if needed.

5. Extract the server and move the file to the Behat root folder:
<blockquote>
E.g. ~/projects/behat 
</blockquote>
(this is the recommended install location)

6. Match the behat.yml file should to this:
<blockquote>
default: <br>
  extensions: <br>
    Behat\MinkExtension\Extension: <br>
      base_url: localhost:8000 <br>
      browser_name: chrome <br>
      goutte: ~ <br>
      selenium2: ~ <br>
</blockquote>


Start the selenium standalone
========================================
* For firefox:
<blockquote>
java -jar selenium-server-standalone-2.40.0.jar
</blockquote>
* For chrome:
<blockquote>
java -jar selenium-server-standalone-2.40.0.jar -Dwebdriver.chrome.driver=chromedriver
</blockquote>