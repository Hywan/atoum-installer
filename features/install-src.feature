Feature: Install sources
  Background:
    Given I run "test -d ./atoum && rm -rf ./atoum"

  Scenario: Install from sources in the current directory
    Given I run "php -n ./installer"
     Then I should see output matching
        """
        > atoum installer
        > The modern, simple and intuitive PHP 5\.3\+ unit testing framework\.
        >> Checking requirements\.\.\.
        >>> Actual PHP version is 5\.[0-9a-zA-Z\-\.]*
        >>> PHAR extension is enabled
        >>> XML extension is enabled
        >>> To generate code coverage report you need to install XDebug
        >>> You have required permissions on [^\s]*
        >> Installing from sources\.\.\.
        >>> Directory [^\s]* does not exist\.
        >>> Cloning source repository\.\.\.
        >>> git clone git:\/\/github\.com\/mageekguy\/atoum\.git [^\s]*atoum
        Cloning into '?[^\s]*atoum'?\.\.\.
        >>> Installed atoum master@[a-z0-9]{7}
        >> atoum sources path \: [^\s]*atoum
        >> atoum bin path \: [^\s]*atoum\/bin\/atoum
        >> atoum was successfully installed\. Enjoy!
        """
    Given I run "php atoum/bin/atoum"
     Then The command should exit with success status
    Given I run "rm -rf ./atoum"
     Then The command should exit with success status

  Scenario: Install from a custom source repository (Git)
    Given I run "ATOUM_GIT_URL=git://github.com/jubianchi/atoum.git php -n ./installer"
     Then I should see output matching
        """
        > atoum installer
        > The modern, simple and intuitive PHP 5\.3\+ unit testing framework\.
        >> Checking requirements\.\.\.
        >>> Actual PHP version is 5\.[0-9a-zA-Z\-\.]*
        >>> PHAR extension is enabled
        >>> XML extension is enabled
        >>> To generate code coverage report you need to install XDebug
        >>> You have required permissions on [^\s]*
        >> Installing from sources\.\.\.
        >>> Directory [^\s]* does not exist\.
        >>> Cloning source repository\.\.\.
        >>> git clone git:\/\/github\.com\/jubianchi\/atoum\.git [^\s]*atoum
        Cloning into '?[^\s]*atoum'?\.\.\.
        >>> Installed atoum master@[a-z0-9]{7}
        >> atoum sources path \: [^\s]*atoum
        >> atoum bin path \: [^\s]*atoum\/bin\/atoum
        >> atoum was successfully installed\. Enjoy!
        """
    Given I run "php atoum/bin/atoum"
     Then The command should exit with success status
    Given I run "rm -rf ./atoum"
     Then The command should exit with success status

  Scenario: Update existing installation
    Given I run "php -n ./installer"
      And I run "php -n ./installer"
     Then I should see output matching
        """
        > atoum installer
        > The modern, simple and intuitive PHP 5\.3\+ unit testing framework\.
        >> Checking requirements\.\.\.
        >>> Actual PHP version is 5\.[0-9a-zA-Z\-\.]*
        >>> PHAR extension is enabled
        >>> XML extension is enabled
        >>> To generate code coverage report you need to install XDebug
        >>> You have required permissions on [^\s]*
        >> Installing from sources\.\.\.
        >>> Directory [^\s]* exists\.
        >> Updating sources\.\.\.
        >>> cd [^\s]*atoum && git fetch origin && git reset --hard origin\/master
        HEAD is now at [a-z0-9]{7} .*
        >>> Updated atoum to master@[a-z0-9]{7}
        >> atoum sources path : [^\s]*atoum
        >> atoum bin path : [^\s]*atoum\/bin\/atoum
        >> atoum was successfully installed\. Enjoy!
        """
    Given I run "rm -rf ./atoum"
     Then The command should exit with success status
