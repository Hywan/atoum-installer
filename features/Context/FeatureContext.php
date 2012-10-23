<?php
use
    Behat\Behat\Context\BehatContext,
    Behat\Gherkin\Node\PyStringNode
;

class FeatureContext extends BehatContext {
    private $output;
    private $status;

    /**
     * @Given /^I run \"(?P<command>[^\"]*)\"$/
     */
    public function iRun($command)
    {
        $this->output = null;
        $this->status = null;
        exec($command, $this->output, $this->status);

        $this->output = array_map('trim', $this->output);

        $this->output = implode(PHP_EOL, (array)$this->output);
    }

    /**
     * @Then /^I should see$/
     */
    public function iShouldSee(PyStringNode $string)
    {
        if($this->output !== (string)$string) {
            $expected = (string)$string;
            $expected = '(' . strlen($expected) . ')' . PHP_EOL . $expected .PHP_EOL . PHP_EOL;

            $actual = $this->output;
            $actual = '(' . strlen($actual) . ')' . PHP_EOL . $actual . PHP_EOL . PHP_EOL;

            throw new \Exception(sprintf('Expected %sGot %s', $expected, $actual));
        }
    }

    /**
     * @Then /^I should see output matching$/
     */
    public function iShouldSeeOutputMatching(PyStringNode $string)
    {
        $expected = (string)$string;
        $actual = $this->output;
        $matches = array();
        if(false == preg_match_all('/' . $expected . '/', $actual, $matches)) {
            $expected = PHP_EOL . $expected .PHP_EOL . PHP_EOL;
            $actual = '(' . strlen($actual) . ')' . PHP_EOL . $actual . PHP_EOL . PHP_EOL;

            throw new \Exception(sprintf('String %sDoes not match %s', $actual, $expected));
        }
    }

    /**
     * @Then /^The command should exit with success status$/
     */
    public function theCommandShouldExitWithSuccessStatus()
    {
        if(0 !== $this->status) {
            throw new \Exception('The command exited with a non-zero status code (%d)', $this->status);
        }
    }
}