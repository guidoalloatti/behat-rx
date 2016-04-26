<?php

use Behat\Behat\Context\ClosuredContextInterface,
    Behat\Behat\Context\TranslatedContextInterface,
    Behat\Behat\Context\BehatContext,
    Behat\Behat\Exception\PendingException;
use Behat\Gherkin\Node\PyStringNode,
    Behat\Gherkin\Node\TableNode;
use Behat\MinkExtension\Context\MinkContext;

//
// Require 3rd-party libraries here:
//
//   require_once 'PHPUnit/Autoload.php';
//   require_once 'PHPUnit/Framework/Assert/Functions.php';
//

/**
 * Features context.
 */
class FeatureContext extends MinkContext
{
    /**
     * Initializes context.
     * Every scenario gets its own context object.
     *
     * @param array $parameters context parameters (set them up through behat.yml)
     */
    public function __construct(array $parameters)
    {
        // Initialize your context here
    }
 
    /**
     * @Given /^I wait for (\d+) seconds$/
     */
    public function iWaitForSeconds($seconds)
    {   
        $waitFor = 1000*$seconds;
        $this->getSession()->wait($waitFor);
    }

    /**
     * @Then /^I wait for the suggestion box to appear$/
     */
    public function iWaitForTheSuggestionBoxToAppear()
    {
        $this->getSession()->wait(5000,
            "$('.suggestions-results').children().length > 0"
        );
    }

    /**
     * @Then /^the button "([^"]*)" should be enabled$/
     */
    public function theButtonShouldBeEnabled($cssSelector)
    {
        $session = $this->getSession();
        $buttonDisabled = $session->evaluateScript(
            "(function(){ return document.getElementById('".$cssSelector."').disabled; })()"
        );

        if ($buttonDisabled) {
            throw new \InvalidArgumentException(sprintf('The button %s is not enabled!', $cssSelector));
        }   
    }


    /**
     * @Then /^the button "([^"]*)" should be disabled$/
     */
    public function theButtonShouldBeDisabled($cssSelector)
    {
        $session = $this->getSession();
        $buttonDisabled = $session->evaluateScript(
            "(function(){ return document.getElementById('".$cssSelector."').disabled; })()"
        );

        if (!$buttonDisabled) {
            throw new \InvalidArgumentException(sprintf('The button %s is not disabled!', $cssSelector));
        }   
    }
}
