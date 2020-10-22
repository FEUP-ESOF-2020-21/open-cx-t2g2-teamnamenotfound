# openCX-*Safe Meetings* Development Report

Welcome to the documentation pages of the *Safe Meetings* of **openCX**!

You can find here detailed about the (sub)product, hereby mentioned as module, from a high-level vision to low-level implementation decisions, a kind of Software Development Report (see [template](https://github.com/softeng-feup/open-cx/blob/master/docs/templates/Development-Report.md)), organized by discipline (as of RUP): 

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

So far, contributions are exclusively made by the initial team, but we hope to open them to the community, in all areas and topics: requirements, technologies, development, experimentation, testing, etc.

Please contact us! 

Thank you!
* [Diogo Nunes](https://github.com/diogoabnunes)
* [Diogo Santos](https://github.com/DiogoF17)
* [Jéssica Nascimento](https://github.com/jessymireie)
* [João Vítor Fernandes](https://github.com/JViii)
* [Marina Dias](https://github.com/marinuas)

## Product Vision
In spite of the current situation, with Safe Meetings we want to be able to provide our users the best possible conferences reducing non attendees priority selection to future conferences.

---
## Elevator Pitch

During this rough times, have you found yourself worried about reserving your place for an opportunity of personal and professional growth?
Well, with Safe Meetings you can save a spot in all the conferences that you want to go, you need only to do a quick registration and we'll handle the rest, you will even be able to submit a review about the conference's safety, hygiene, etc.

---
## Requirements

In this section, you should describe all kinds of requirements for your module: functional and non-functional requirements.

Start by contextualizing your module, describing the main concepts, terms, roles, scope and boundaries of the application domain addressed by the project.

### Use case diagram 

![Use Cases diagram](/images/use_cases.png)

**See Conference Info**
*Actor:* User/Organizer
*Description:* When the user/organizer runs the app it shows all the curent conferences registred and their general information, in order to see more info about their he should touch in one of the conferences and all the info available will be displayed.
*Normal Flow:* run the app and then select a conference.

**Search Conference**
*Actor:* User/Organizer
*Description:* When the user/organizer runs the app it shows all the curent conferences registred and their general information. If the user wants he can search for a specific conference that respects the parameters specified by the user in the search.
*Normal Flow:* run the app and then select the search option.

**Evaluate Conference**
*Actor:* User
*Description:* When the user wntas to evaluate a conference he should select the desired one and then touch the button "Evaluate Conference" that will ask for a token that only the users that attended the conference will have, and then a form with some questions that will evaluate the conference will be displayed then the user should submit it.
*Normal Flow:* The user selects the conference, then the "Evaluate Conference" button and answer the form.

### User stories

* As a user, I want to be able to see all the conferences info so that I can choose the best option.
  - *Mockup*
  - *Acceptance tests*
  - **Value and effort**: M

* As a user, I want to be able to evaluate the conference so that users are aware of its condition.
  - *Mockup*
  - *Acceptance tests*
  - **Value and effort**: L

* As a user, I want to be able to search for a conference by their rating in each parameter, so that I'm aware about the conference conditions.
  - *Mockup*
  - *Acceptance tests*
  - **Value and effort**: L

**User interface mockups**.
After the user story text, you should add a draft of the corresponding user interfaces, a simple mockup or draft, if applicable.

**Acceptance tests**.
For each user story you should write also the acceptance tests (textually in Gherkin), i.e., a description of scenarios (situations) that will help to confirm that the system satisfies the requirements addressed by the user story.


### Domain model

To better understand the context of the software system, it is very useful to have a simple UML class diagram with all the key concepts (names, attributes) and relationships involved of the problem domain addressed by your module.

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
The goal of this subsection is to document the high-level physical structure of the software system (machines, connections, software components installed, and their dependencies) using UML deployment diagrams or component diagrams (separate or integrated), showing the physical structure of the system.

It should describe also the technologies considered and justify the selections made. Examples of technologies relevant for openCX are, for example, frameworks for mobile applications (Flutter vs ReactNative vs ...), languages to program with microbit, and communication with things (beacons, sensors, etc.).

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

Configuration and change management are key activities to control change to, and maintain the integrity of, a projects artifacts (code, models, documents).

For the purpose of ESOF, we will use a very simple approach, just to manage feature requests, bug fixes, and improvements, using GitHub issues and following the [GitHub flow](https://guides.github.com/introduction/flow/).


---

## Project management

Software project management is an art and science of planning and leading software projects, in which software projects are planned, implemented, monitored and controlled.

In the context of ESOF, we expect that each team adopts a project management tool capable of registering tasks, assign tasks to people, add estimations to tasks, monitor tasks progress, and therefore being able to track their projects.

Example of tools to do this are:
  * [Trello.com](https://trello.com)
  * [Github Projects](https://github.com/features/project-management/com)
  * [Pivotal Tracker](https://www.pivotaltracker.com)
  * [Jira](https://www.atlassian.com/software/jira)

We recommend to use the simplest tool that can possibly work for the team.


---

## Evolution - contributions to open-cx

Describe your contribution to open-cx (iteration 5), linking to the appropriate pull requests, issues, documentation.
