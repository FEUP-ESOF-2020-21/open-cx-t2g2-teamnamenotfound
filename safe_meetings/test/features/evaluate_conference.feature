Feature: Evaluate Conference

    Scenario: The evaluate screen shows up when the user tap evaluate conferences button
        Given the user is logged in with a valid account and the app is in home screen
        When I tap the "evaluateButton" button
        Then "evaluateScreen" screen shows up