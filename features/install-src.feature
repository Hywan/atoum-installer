Feature: Install sources
  Scenario: Install from sources in the current directory
    Given I run "php -n ./installer"
     Then I should see output matching
        """

        """
    Given I run "php atoum/bin/atoum"
     Then The command should exit with success status
    Given I run "rm -rf ./atoum"
     Then The command should exit with success status

  Scenario: Install from a custom source repository (Git)
    Given I run "ATOUM_GIT_URL=git://github.com/jubianchi/atoum.git php -n ./installer"
     Then I should see output matching
        """

        """
    Given I run "php atoum/bin/atoum"
     Then The command should exit with success status
    Given I run "rm -rf ./atoum"
     Then The command should exit with success status
