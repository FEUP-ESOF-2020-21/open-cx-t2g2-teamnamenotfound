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

    ![Initial Screen](/images/mockup_initial_screen.png)
    ![Info Screen](/images/mockup_info_screen.png)

  - **Aceptance Tests**

    - Verify if when the user taps in a conference, all the conference info should show up.
    ![Conference Info Acceptance Tests](/images/confInfoAcceptTest.png)
    - Veirfy if when the user taps the arrow back the app goes to home.

  - **Value and effort**: M

* As a user, I want to be able to evaluate the conference so that users are aware of its condition.
  - *Mockup*

    ![Evaluate Screen](/images/mockup_evaluate_screen.png)

  - *Acceptance tests*

    - Verify if when the user taps evaluate conferences button the evaluate screen shows up.
    ![Evaluate Conference Acceptance Tests](/images/evalConfAcceptTest.png)
    - Verify if when the user inputs the correct code a window asking for the evaluation shows up.
    - Verify if when the user inputs the wrong code the app should remain in the same window.
    - Veirfy if when the user taps submit button all the evaluations parameters are sent to the database.

  - **Value and effort**: L

* As a user, I want to be able to search for a conference by their rating in each parameter, so that I'm aware about the conference conditions.
  - *Mockup*
  
    ![Search Screen](/images/mockup_search_screen.png)

  - **Acceptance tests**

  - Verify if when the user taps the search button, a window with several filters shows up.
  ![Search Conference Acceptance Tests](/images/searchConfAcceptTest.png)
  - Veirfy if when the user taps the filter button all the filters are sent to home.
  - Veirfy if when the user taps the arrow back the app goes to home without changing the current filters.

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
![Logical Architecture](/images/logical_architecture.png)

### Physical architecture
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

There are several ways of documenting testing activities, and quality assurance in general, being the most common: a strategy, a plan, test case specifications, and test checklists.

In this section it is only expected to include the following:
* test plan describing the list of features to be tested and the testing methods and tools;
* test case specifications to verify the functionalities, using unit tests and acceptance tests.
 
A good practice is to simplify this, avoiding repetitions, and automating the testing actions as much as possible.

---
## Configuration and change management

In order to be able manage project changes, we tried as much as possible to follow [git flow](https://www.atlassian.com/git/tutorials/comparing-workflows/gitflow-workflow). 
So when we wanted to fix some bug or add some new feature we used branches and we also created pull requests, the other elements could try it by themselves and then tell us something about it. If everyone agreed that the code was working as it should we merged it with main. 
Here is a link to our [git flow](https://github.com/FEUP-ESOF-2020-21/open-cx-t2g2-teamnamenotfound/commits/main).

---

## Project management

In order to be able to manage our project we used [Github Projects](https://github.com/FEUP-ESOF-2020-21/open-cx-t2g2-teamnamenotfound/projects).


