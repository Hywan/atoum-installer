Feature: Available
  Scenario: Installer URL
    Given I run "wget -O /tmp/installer https://raw.github.com/atoum/atoum-installer/master/installer > /dev/null 2>&1"
     Then The command should exit with success status
    Given I run "rm /tmp/installer > /dev/null 2>&1"
     Then The command should exit with success status

  Scenario: PHAR URL
    Given I run "wget -O /tmp/mageekguy.atoum.phar http://downloads.atoum.org/nightly/mageekguy.atoum.phar > /dev/null 2>&1"
     Then The command should exit with success status
    Given I run "rm /tmp/mageekguy.atoum.phar > /dev/null 2>&1"
     Then The command should exit with success status