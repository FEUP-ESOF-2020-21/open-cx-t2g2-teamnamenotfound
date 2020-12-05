Feature: Search Conference

    Scenario: The search screen shows up when the user tap search button
        Given the user is logged in with a valid account and the app is in home screen
        When I tap the "searchButton" button
        Then "searchScreen" screen shows up