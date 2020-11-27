Feature: Evaluate Conference

    Scenario: A window asking the code shows up when evaluate button is pressed
        Given the app is in the conference info screen
        When evaluate button is pressed
        Then a window asking the code shows up