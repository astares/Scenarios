# Scenarios - a BDD framework for Pharo
[![Pharo](https://img.shields.io/static/v1?style=for-the-badge&message=Pharo&color=3297d4&logo=Harbor&logoColor=FFFFFF&label=)](https://www.pharo.org) 
[![BDD](https://img.shields.io/static/v1?style=for-the-badge&message=BDD&color=044a64&logo=BDD&logoColor=FFFFFF&label=)](https://en.wikipedia.org/wiki/Behavior-driven_development)

[![Build](https://github.com/gcorriga/Scenarios/actions/workflows/build.yml/badge.svg)](https://github.com/gcorriga/Scenarios/actions/workflows/build.yml)

[![Pharo 10](https://img.shields.io/badge/Pharo-10-%23aac9ff.svg)](https://pharo.org/download)
[![Pharo 11](https://img.shields.io/badge/Pharo-11-%23aac9ff.svg)](https://pharo.org/download)

## What's this?
**_Scenarios_** is a framework to support [Behavior Driven Development](https://en.wikipedia.org/wiki/Behavior-driven_development) (BDD) and [Acceptance Test Driven Development](https://en.wikipedia.org/wiki/Acceptance_test-driven_development) (ATDD) in [Pharo](https://www.pharo.org).

As of 20 December 2023, it implements the bare minimum to allow people to get started.

The short term plan is ensure the implemented features are documented using the framework itself, to validate its design choices.

The long term plan is to develop the framework to support most if not all features of [Cucumber](https://cucumber.io/), including support for Cucumber's [Gerkhin](https://cucumber.io/docs/gherkin/) language.

## Installing
To install the library, execute the following code in a workspace:

```Smalltalk
Metacello new
    repository: 'github://gcorriga/Scenarios:main/src';
    baseline: 'Scenarios';
    load
```
## Intro to BDD 
### Main components
#### Feature
A **feature** represents a distinct aspect of the system’s functionality, which can provide value to a user. Features are usually written from the perspective of a user role. Each feature contains one or many scenarios that describe its behaviors.

Within the framework features are represented using the class **_Feature_**.

#### Scenario
A **scenario** is a concrete example that illustrates a business rule. It is a written description of your products behavior from one or more users perspectives. A scenario consists of a list of (scenario) steps.

Within the framework features are represented using the class **_Scenario_**.

#### Steps
A scenario step is a component of a scenario that describes a specific action, condition, or outcome. Each scenario is made up of one or more steps, and each step starts with a keyword like Given, When, Then, And, But.

Within the framework steps are represented using the class **_ScenarioSteps_**.

## Using the framework

### Creating features and scenarios
To create a new Feature, create a new subclass of existing framework class `Feature`:

```Smalltalk
Feature subclass: #SampleFeature
	instanceVariableNames: ''
	classVariableNames: ''
	package: 'Scenarios-Tests-Sample'
```

To add a scenario, add a new method to your feature class and tag it with the `#Scenario:` pragma. The pragma takes one argument which will be the title of the scenario.

```Smalltalk
scenarioHasSteps
	<Scenario: 'A scenario has one or more steps'>
```

Then the Scenario steps are **declared** by sending the `#given:`, `#when:`, and `#then:` messages within the method body.

```Smalltalk
scenarioHasSteps
	<Scenario: 'A scenario has one or more steps'>
	self
		given: 'A scenario with steps';
		when: 'A Scenario object gets created from it';
		then: 'The Scenario object has all the steps'
```
The current convention is to categorize the scenario methods in a _scenarios_ protocol.

### Defining steps
Steps will then be **defined** in the same feature class.

Each step can be defined in its own method tagged with one of the #`Given:`, `#When:`, or `#Then:` pragmas:

```Smalltalk
failingScenario
	<Then: 'The scenario could fail'>
	self assert: false
```
The current convention is to categorize the step methods in a _steps_ protocol.

### Running features and scenarios
At the moment, there is a SimpleScenarioRunner that needs to be triggered from a Playground.

To execute all Features, evaluate 

```Smalltalk
SimpleScenarioRunner new runAllFeatures 
```

in a Playground. 

To execute only one `Feature`, send `#run` to a class instance. 
Example: evaluate 

```Smalltalk
SampleFeature new run
``` 

in a Playground to execute all scenarios in class `SampleFeature`.

To run a single scenario, send `#runNamed:` to a class instance with the name of the scenario as the argument.
Example: evaluate

```Smalltalk
SampleFeature new runNamed: 'Running a scenario'
```

in a Playground to execute only the scenario named 'Running a scenario'.

### Examples
We are using Scenarios itself to drive the testing and development of the framework. The features defined in the _Scenarios-Features_ package can be used as examples of how to use the framework.
