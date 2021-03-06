Feature: Usage
  Scenario:
    Given I run "./installer --usage"
     Then I should see
        """
        > atoum installer
        > The modern, simple and intuitive PHP 5.3+ unit testing framework.
        --global        : Install atoum as a global command
        --phar          : Install atoum as a PHAR archive
        --source        : Install atoum from sources (default)
        --check         : Only run system requirements check

        Environment :
        ATOUM_GIT_URL   : Git repository (default : git://github.com/atoum/atoum.git)
        ATOUM_PATH      : Installation directory (default : /usr/share)
        ATOUM_SYMLINK   : atoum bin symlink path (default: /usr/local/bin)

        Examples :
        $ curl https://raw.github.com/atoum/atoum-installer/master/installer | php -- --phar
        $ curl https://raw.github.com/atoum/atoum-installer/master/installer | sudo php -- --global
        $ curl https://raw.github.com/atoum/atoum-installer/master/installer | ATOUM_PATH=/home/me php
        """