# openCX-*Safe Meetings* Development Report

Welcome to the documentation pages of the *Safe Meetings* of **openCX**!

* Business modeling 
  * [Product Vision](#Product-Vision)
  * [Elevator Pitch](#Elevator-Pitch)
* Requirements
  * [Use Case Diagram](#Use-case-diagram)
  * [User stories](#User-stories)
  * [Domain model](#Domain-model)
* Architecture and Design
  * [Logical architecture](#Logical-architecture)
  * [Physical architecture](#Physical-architecture)
  * [Prototype](#Prototype)
* [Implementation](#Implementation)
* [Test](#Test)
* [Configuration and change management](#Configuration-and-change-management)
* [Project management](#Project-management)

Please contact us!

Thank you!
* [Diogo Nunes](https://github.com/diogoabnunes)
* [Diogo Santos](https://github.com/DiogoF17)
* [Jéssica Nascimento](https://github.com/jessymireie)
* [João Vítor Fernandes](https://github.com/JViii)
* [Marina Dias](https://github.com/marinuas)

## Product Vision
With Safe Meetings we want to be able to provide our users the best possible conferences, while assuring their health safety in physical meetings.

---
## Elevator Pitch

During these rough times, do you wonder if an opportunity of personal and professional growth is safe? Well, with Safe Meetings you can see how safe is a conference that you want to go. Now, just go, enjoy and then tell us how it went by submitting a review!

---
## Requirements

### Use case diagram 

![Use Cases diagram](/images/use_cases.png)

**See Conference Info**

* *Actor:* User/Organizer
* *Description:* When the user/organizer runs the app it shows all the curent conferences registred and their general information, in order to see more info about their he should touch in one of the conferences and all the info available will be displayed.
* *Normal Flow:* Run the app and then select a conference.
* *Preconditions:* User must be in home screen and then select the desired conference.
* *Posconditions:* User will be in the see info screen where it will be all the conference info.

**Search Conference**

* *Actor:* User/Organizer
* *Description:* When the user/organizer runs the app it shows all the curent conferences registred and their general information. Users can search for a specific conference that respects the parameters specified by the user in the search.
* *Normal Flow:* Run the app and then select the search option.
* *Preconditions:* User must be in home screen.
* *Posconditions:* After user touch the filter button the app will go to the home screen showing only the conferences that respect the desired filters.

**Evaluate Conference**

* *Actor:* User
* *Description:* By the end of each conference a code will be given to the attendees so that they can evaluate the conference.
* *Normal Flow:* The user scans with his phone the code which should lead them to a form, that in the end they must submit so that their evaluation is saved.
* *Preconditions:* User must be in home screen.
* *Posconditions:* After the user evaluate the desired conference the app will go to the home screen.

### User stories

* As a user, I want to be able to see all the conferences info so that I can choose the best option.
  - *Mockup*

    ![Initial Screen](/images/mockup_initial.png)
    ![Info Screen](/images/mockup_info.png)

  - **Aceptance Tests**

  **Implemented**
  ```gherkin
    Feature: Conference Info

    Scenario: The conference info screen shows up when a conference is tapped
        Given the user is logged in with a valid account and the app is in home screen
        When I tap the "conference1Button" button
        Then "conferenceScreen" screen shows up

    ```

  **To be implemented in future**  
  ```gherkin 

    Scenario: The app goes back to home screen when we tap arrow button
        Given the user is logged in with a valid account and the app in in conferenceScreen
        When I tap the "arrowButton" button
        Then "homeScreen" shows up
  ```

  - **Value and effort**: M

* As a user, I want to be able to evaluate the conference so that users are aware of its condition.
  - *Mockup*

    ![Evaluate Screen](/images/mockup_evaluate.png)

  - *Acceptance tests*

    **Implemented**
    ```gherkin
      Feature: Evaluate Conference

      Scenario: The evaluate screen shows up when the user tap evaluate conferences button
          Given the user is logged in with a valid account and the app is in home screen
          When I tap the "evaluateButton" button
          Then "evaluateScreen" screen shows up

    ```
        
    **To be implemented in future**
    ```gherkin
      Scenario: The code screen shows up when the user tap in a conference to evaluate
          Given the user is logged in with a valid account and the app is in evaluate screen
          When I tap the "conference1Button"
          Then "codeScreen" shows up

      Scenario: The code screen remains when the user inputs the wrong code
          Given the user is logged in with a valid account and the app is in code screen
          When I input the wrongCode and tap "submitButton"
          Then "codeScreen" remains

      Scenario: The form screen shows up when the user inputs the correct code
          Given the user is logged in with a valid account and the app is in code screen
          When I input the correctCode and tap "submitButton"
          Then "formScreen" shows up

      Scenario: The evaluate screen shows up when the user submits the form
          Given the user is logged in with a valid account and the app is in form screen
          When I tap the "submitButton"
          Then the evaluations are saved and "evaluateScreen" shows up

    ```

  - **Value and effort**: L

* As a user, I want to be able to search for a conference by their rating in each parameter, so that I'm aware about the conference conditions.
  - *Mockup*
  
    ![Search Screen](/images/mockup_search.png)

  - **Acceptance tests**

  **Implemented**
  ```gherkin
      Feature: Search Conference

      Scenario: The search screen shows up when the user tap search button
          Given the user is logged in with a valid account and the app is in home screen
          When I tap the "searchButton" button
          Then "searchScreen" screen shows up

  ```

  **To be implemented in future**
  ```gherkin

      Scenario: The home screen shows up and filters are saved when the user tap filter button
          Given the user is logged in with a valid account and the app is in search screen
          When I tap the "filterButton" button
          Then "homeScreen" screen shows up and the filters are saved

      Scenario: The app goes back to home screen when we tap arrow button and don't save the filters
        Given the user is logged in with a valid account and the app in in filterScreen
        When I tap the "arrowButton" button
        Then "homeScreen" shows up and the filters are not saved
    ```

  - **Value and effort**: L

**Map**

   ![User Story Map](/images/Blank_diagram.png)


### Domain model

A user can be both an organizer and a participant in a conference. The only difference between these is that the organizer has access to the evaluation code in the information of the conferences he organizes.

During the conference the evaluation code is given to the participants of the conference so that only they can evaluate, not allowing people who have not been to the conference to evaluate.
A participant can evaluate a conference only once.

  ![Domain Model](/images/domain-model.png)
---

## Architecture and Design

### Logical architecture
The user starts out by being asked to login with google before he can access further features of the application, we decided to use this in order to minimize the load on our database and other possible issues that could be caused by mass production of fake bot accounts.

After that is complete we load the conferences and display them in a friendly way, you can pick from the displayed conferences or search and filter the desired one, this is very useful when there are a lot of conferences on the home screen otherwise you would have to scroll which would be very impractical. After going to a conference you will receive a code which can be used to enter our 'evaluate conference' feature, when you're done your review will be stored and used to calculate the average security,hygien and interest of that conference along with the other reviews of people who attended.

![Logical Architecture](/images/logical_architecture.png)


### Physical architecture
The physical architecture consists of an android device (phone,tablet,etc..) which interacts with firebase servers in order to access our databases, this is used to keep the displayed data on the device updated and store new data when a participant evaluates a conference.

![Physical Architecture](/images/physical_architecture.png)


### Prototype
![gif](/images/app.gif)


## Implementation

To implement this project we divide our work through all the 4 iterations. Above there is a list that explains what work was developed in each iteration.  

**Iteration 1**  
In this first iteration we started by learning about how flutter works, start developing the report(product vision, elevator pitch, use cases, user stories and mockups) and we also started to implement our app. We implemented the home screen and the conference info screen of our app, and we also started to try establish communication with firebase.

**Iteration 2**  
In this second iteration we implemented a few more features in our app, such as the search screen and the refresh screen. We also started to try implement the login feature but we were not able to conclude this implementation.

**Iteration 3**  
In this iteration we ended the implementation of login, we also started to try to implement the acceptance tests and we inserted information in the report about the acceptance tests.

**Iteration 4**  
In this final iteration we implemented our final feature that is evaluate a conference, we implemented as well unit tests and we conclude the report inserting the remaing information(domain model, logical architecture, Physical architecture, prototype, implementation, test, configuration and change management and project management).

---
## Test

To test our code, we implement acceptance tests and unit tests.

We focus our tests on:
* Tap buttons and shows up another screen, in the case of acceptance tests;
* Confirm class functions envolving conferences and respective filters.

### Acceptance Tests
To make this tests we used flutter_gherkin and we tested the following features:  
* **Conference Info:** in this feature we tested if when we thouched a conference a conference info screen showed up. 
  - User Story: [Conference Info](https://github.com/FEUP-ESOF-2020-21/open-cx-t2g2-teamnamenotfound/issues/3).
* **Evaluate Conference:** in this feature we tested if when we touched the evaluate conference button a screen showing the available conferences to evaluate showed up. 
  - User Story: [Evaluate Conference](https://github.com/FEUP-ESOF-2020-21/open-cx-t2g2-teamnamenotfound/issues/7).
* **Search Conference:** in this one we tested if when we touched the search button a screen showing the available filters showed up. 

  - User Story: [Search Conference](https://github.com/FEUP-ESOF-2020-21/open-cx-t2g2-teamnamenotfound/issues/8).

We only implemented one acceptance test per user story(specified above) because it took too much time and was very difficult understand how acceptance tests worked in flutter.
There are still some more tests that could be made to test our user stories in future, some of them are specified above in each user story.

### Unit Tests
* **Conference data:** every parameter has what it supposed to have;
* **Evaluate conference:** evaluation parameters are refreshed, so as voted users;
* **Search conference:** filters are working as expected: only shows conferences within the applied filters.

### How to test
* Unit Tests are running automatically on [GitHub Actions](https://github.com/FEUP-ESOF-2020-21/open-cx-t2g2-teamnamenotfound/actions).
* Unfortunately, the pipeline running the gherkin acceptance tests are not running because they need an emulator to test. To run this tests, we suggest you to:
  * git clone https://github.com/FEUP-ESOF-2020-21/open-cx-t2g2-teamnamenotfound.git
  * open the project on Android Studio/Visual Studio Code (assuming you already have all the tools to run the project)
  * open any emulator
  * confirm you are on safe_meetings folder, otherwise go there
  * run the command: flutter test test/app_test.dart
  
---
## Configuration and change management

In order to be able manage project changes, we tried as much as possible to follow [Git Flow](https://www.atlassian.com/git/tutorials/comparing-workflows/gitflow-workflow). 
So when we wanted to fix some bug or add some new feature we used branches and we also created pull requests, the other elements could try it by themselves and then tell us something about it. If everyone agreed that the code was working as it should we merged it with main.

---

## Project management

In order to be able to manage our project we used [Github Projects](https://github.com/FEUP-ESOF-2020-21/open-cx-t2g2-teamnamenotfound/projects).


