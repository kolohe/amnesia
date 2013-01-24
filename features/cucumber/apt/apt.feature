Feature: Installing packages through APT
  As a Tails user
  when I set an administration password in Tails Greeter
  I should be able to install packages using apt-get and synaptic
  and all network traffic should flow only through Tor.

  Background:
    Given I restore the background snapshot if it exists
    And a freshly started Tails
    And I log in to a new session with sudo password "asdf"
    And GNOME has started
    And I have a network connection
    And Tor has built a circuit
    And Iceweasel has autostarted and is not loading a web page
    And the time has synced
    And I have closed all annoying notifications
    And APT's sources are only {ftp.us,security,back-ports}.debian.org
    And I save the background snapshot if it does not exist

  Scenario: Install packages using apt-get
    When I update APT using apt-get
    Then I should be able to install a package using apt-get
    And all Internet traffic has only flowed through Tor

  Scenario: Install packages using synaptic
    When I run "gksu synaptic"
    And I enter the sudo password in the PolicyKit prompt
    And I update APT using synaptic
    Then I should be able to install a package using synaptic
    And all Internet traffic has only flowed through Tor
