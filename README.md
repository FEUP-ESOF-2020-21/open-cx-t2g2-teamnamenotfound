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

In this section, you should describe all kinds of requirements for your module: functional and non-functional requirements.

Start by contextualizing your module, describing the main concepts, terms, roles, scope and boundaries of the application domain addressed by the project.

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
    ![Conference Info Acceptance Tests](/images/conference_info_acceptance_tests.png)
    - Veirfy if when the user taps the arrow back the app goes to home.

  - **Value and effort**: M

* As a user, I want to be able to evaluate the conference so that users are aware of its condition.
  - *Mockup*

    ![Evaluate Screen](/images/mockup_evaluate_screen.png)

  - *Acceptance tests*

    - Verify if when the user taps evaluate button a window asking for a code shows up.
    ![Evaluate Conference Acceptance Tests](/images/evaluate_conference_acceptance_tests.png)
    - Verify if when the user inputs the correct code a window asking for the evaluation shows up.
    - Verify if when the user inputs the wrong code the app should remain in the same window.
    - Veirfy if when the user taps submit button. all the evaluations parameters are sent to the database.

  - **Value and effort**: L

* As a user, I want to be able to search for a conference by their rating in each parameter, so that I'm aware about the conference conditions.
  - *Mockup*
  
    ![Search Screen](/images/mockup_search_screen.png)

  - **Acceptance tests**

  - Verify if when the user taps the search button, a window with several filters shows up.
  ![Search Conference Acceptance Tests](/images/search_conference_acceptance_tests.png)
  - Veirfy if when the user taps the filter button all the filters are sent to home.
  - Veirfy if when the user taps the arrow back the app goes to home without changing the current filters.

  - **Value and effort**: L

**User interface mockups**.
After the user story text, you should add a draft of the corresponding user interfaces, a simple mockup or draft, if applicable.

**Acceptance tests**.
For each user story you should write also the acceptance tests (textually in Gherkin), i.e., a description of scenarios (situations) that will help to confirm that the system satisfies the requirements addressed by the user story.

**Map**

   ![User Story Map](/images/Blank_diagram.png)


### Domain model

A user can be both an organizer and a participant in a conference. The only difference between these is that the organizer has access to the evaluation code in the information of the conferences he organizes.

During the conference the evaluation code is given to the participants of the conference so that only they can evaluate, not allowing people who have not been to the conference to evaluate.
A participant can evaluate a conference only once.

  ![Domain Model](/images/domain-model.png)
---

## Architecture and Design
The architecture of a software system encompasses the set of key decisions about its overall organization. 

A well written architecture document is brief but reduces the amount of time it takes new programmers to a project to understand the code to feel able to make modifications and enhancements.

To document the architecture requires describing the decomposition of the system in their parts (high-level components) and the key behaviors and collaborations between them. 

In this section you should start by briefly describing the overall components of the project and their interrelations. You should also describe how you solved typical problems you may have encountered, pointing to well-known architectural and design patterns, if applicable.

### Logical architecture
The purpose of this subsection is to document the high-level logical structure of the code, using a UML diagram with logical packages, without the worry of allocating to components, processes or machines.

It can be beneficial to present the system both in a horizontal or vertical decomposition:
* horizontal decomposition may define layers and implementation concepts, such as the user interface, business logic and concepts; 
* vertical decomposition can define a hierarchy of subsystems that cover all layers of implementation.

### Physical architecture
![Physical Architecture](/images/physical_architecture.png)


### Prototype
To help on validating all the architectural, design and technological decisions made, we usually implement a vertical prototype, a thin vertical slice of the system.

In this subsection please describe in more detail which, and how, user(s) story(ies) were implemented.

---

## Implementation
Regular product increments are a good practice of product management. 

While not necessary, sometimes it might be useful to explain a few aspects of the code that have the greatest potential to confuse software engineers about how it works. Since the code should speak by itself, try to keep this section as short and simple as possible.

Use cross-links to the code repository and only embed real fragments of code when strictly needed, since they tend to become outdated very soon.

---
## Test

There are several ways of documenting testing activities, and quality assurance in general, being the most common: a strategy, a plan, test case specifications, and test checklists.

In this section it is only expected to include the following:
* test plan describing the list of features to be tested and the testing methods and tools;
* test case specifications to verify the functionalities, using unit tests and acceptance tests.
 
A good practice is to simplify this, avoiding repetitions, and automating the testing actions as much as possible.

---
## Configuration and change management

Configuration and change management are key activities to control change to, and maintain the integrity of, a project’s artifacts (code, models, documents).

For the purpose of ESOF, we will use a very simple approach, just to manage feature requests, bug fixes, and improvements, using GitHub issues and following the [GitHub flow](https://guides.github.com/introduction/flow/).

---

## Project management

The project management tool we used was [Github Projects](https://github.com/features/project-management/com), capable of registering task, assign tasks to people, add estimations to task, monitor tasks progress, and therefore being able to track their projects.

---

## Evolution - contributions to open-cx

Describe your contribution to open-cx (iteration 5), linking to the appropriate pull requests, issues, documentation.
