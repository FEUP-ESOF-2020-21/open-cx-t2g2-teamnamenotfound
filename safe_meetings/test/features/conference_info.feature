Feature: Conference Info

    Scenario: The conference info screen shows up when a conference is tapped
        Given the user is logged in with a valid account and the app is in home screen
        When I tap the "conference1Button" button
        Then "conferenceScreen" screen shows up

