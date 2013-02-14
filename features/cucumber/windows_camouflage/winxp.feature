Feature: Microsoft Windows XP Camouflage
  As a Tails user
  when I select the Microsoft Windows XP Camouflage in Tails Greeter
  I should be presented with a Microsoft Windows XP like environment

  Background:
    Given I restore the background snapshot if it exists
    And a freshly started Tails
    And the network is unplugged
    And I enable more Tails Greeter options
    And I enable Microsoft Windows XP camouflage
    And I log in to a new session
    And GNOME has started
    And I have closed all annoying notifications
    And I save the background snapshot if it does not exist

  Scenario: I should be presented with a Microsoft Windows XP like desktop
    Then I see "WinXPDesktop.png" after at most 10 seconds
    And I see "WinXPPanel.png" after at most 10 seconds

  Scenario: Windows should appear like those in Microsoft Windows XP
    When I run "iceweasel"
    Then I see "WinXPIceweaselWindow.png" after at most 10 seconds
    And I see "WinXPIceweaselTaskBar.png" after at most 10 seconds
    And I see "WinXPWindowButtons.png" after at most 10 seconds

  Scenario: The panel menu should look like Microsoft Windows XP's start menu
    When I click the start menu
    Then I see "WinXPStartMenu.png" after at most 10 seconds
