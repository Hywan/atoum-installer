Feature: Check
  Scenario: Default PHP config (no php.ini)
    Given I run "ATOUM_PATH=/tmp ATOUM_SYMLINK=/tmp php -n ./installer --check"
     Then I should see output matching
        """
        > atoum installer
        > The modern, simple and intuitive PHP 5\.3\+ unit testing framework\.
        >> Checking requirements\.\.\.
        >>> Actual PHP version is 5\.[0-9a-zA-Z\-\.]*
        >>> PHAR extension is enabled
        >>> XML extension is enabled
        >>> To generate code coverage report you need to install XDebug
        >>> You have required permissions on \/tmp
        """

  Scenario: Two differents target directories (no php.ini)
    Given I run "ATOUM_PATH=/opt ATOUM_SYMLINK=/bin php -n ./installer --check"
     Then I should see output matching
        """
        > atoum installer
        > The modern, simple and intuitive PHP 5\.3\+ unit testing framework.
        >> Checking requirements\.\.\.
        >>> Actual PHP version is 5\.[0-9a-zA-Z\-\.]*
        >>> PHAR extension is enabled
        >>> XML extension is enabled
        >>> To generate code coverage report you need to install XDebug
        >>> You don't have required permissions on \/bin, \/opt
        """

  Scenario: Global install (no php.ini)
    Given I run "php -n ./installer --check --global"
     Then I should see output matching
        """
        > atoum installer
        > The modern, simple and intuitive PHP 5\.3\+ unit testing framework\.
        >> Checking requirements\.\.\.
        >>> Actual PHP version is 5\.[0-9a-zA-Z\-\.]*
        >>> PHAR extension is enabled
        >>> XML extension is enabled
        >>> To generate code coverage report you need to install XDebug
        >>> You don't have required permissions on \/usr\/local\/bin, \/usr\/share
        """

  Scenario: open_basedir restriction (no php.ini)
    Given I run "php -n -dopen_basedir=/tmp ./installer --check --global"
     Then I should see output matching
        """
        > atoum installer
        > The modern, simple and intuitive PHP 5\.3\+ unit testing framework\.
        >> Checking requirements\.\.\.
        >>> Actual PHP version is 5\.[0-9a-zA-Z\-\.]*
        >>> PHAR extension is enabled
        >>> XML extension is enabled
        >>> To generate code coverage report you need to install XDebug
        >>> open_basedir restriction \: \/tmp
        >>>> To fix this issue, try to run \:
        >>>> ATOUM_PATH=\/an\/allowed\/path \.\/installer or curl https\:\/\/raw\.github\.com\/jubianchi\/atoum\-installer\/master\/installer \| ATOUM_PATH=\/an\/allowed\/path php
        >>>> or
        >>>> php \-dopen_basedir= \.\/installer or curl https\:\/\/raw\.github\.com\/jubianchi\/atoum\-installer\/master\/installer \| php \-dopen_basedir=
        >>> You don't have required permissions on \/usr\/local\/bin, \/usr\/share
        """