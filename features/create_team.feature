Feature: Creating a Team
  As a student
  I want to be able to create a team
  So that other people can join it.

  Background:
    Given that I am a student

  Scenario: Student who is not on a team creates a team
    Given that I am not on a team
    When I try to create a new team
    Then a new team should be created
    And I should be a member of the new team

  Scenario: Student who is on a team tries to create a team
    Given that I am on a team
    When I try to create a new team
    Then the new team should not be created
    And I should receive an error
