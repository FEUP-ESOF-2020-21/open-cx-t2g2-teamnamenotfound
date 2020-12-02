Feature: Conference Info

    Scenario: The conference info screen shows up when a conference is tapped
        Given the user is logged in with a valid account and the app is in home screen
        When I tap in a conference
        Then conference info screen shows up

