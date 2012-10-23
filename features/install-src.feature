Feature: Install sources
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
        >>> Directory [^\s]* does not exist.
        >>> git clone git:\/\/github\.com\/mageekguy\/atoum\.git
        Cloning into atoum\.\.\.
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
        >>> Directory [^\s]* does not exist.
        >>> git clone git:\/\/github\.com\/jubianchi\/atoum\.git
        Cloning into atoum\.\.\.
        >>> Installed atoum master@[a-z0-9]{7}
        >> atoum sources path \: [^\s]*atoum
        >> atoum bin path \: [^\s]*atoum\/bin\/atoum
        >> atoum was successfully installed\. Enjoy!
        """
    Given I run "php atoum/bin/atoum"
     Then The command should exit with success status
    Given I run "rm -rf ./atoum"
     Then The command should exit with success status
