Feature: Install PHAR
  Scenario: Install as PHAR in current directory
    Given I run "php -n ./installer --phar"
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
        >> Installing PHAR\.\.\.
        >> atoum PHAR path \: [^\s]*mageekguy\.atoum\.phar
        >> usage \: php mageekguy\.atoum\.phar
        >> atoum was successfully installed\. Enjoy!
        """
    Given I run "php mageekguy.atoum.phar"
     Then The command should exit with success status
    Given I run "rm mageekguy.atoum.phar"
     Then The command should exit with success status
