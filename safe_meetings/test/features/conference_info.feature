Feature: Conference Info

    Scenario: The conference info screen shows up when a conference is tapped
        Given the app is in home screen
        When a conference is tapped
        Then conference info screen shows up

