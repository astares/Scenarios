# Scenarios
[![Pharo](https://img.shields.io/static/v1?style=for-the-badge&message=Pharo&color=3297d4&logo=Harbor&logoColor=FFFFFF&label=)](https://www.pharo.org) 
[![BDD](https://img.shields.io/static/v1?style=for-the-badge&message=BDD&color=044a64&logo=BDD&logoColor=FFFFFF&label=)](https://en.wikipedia.org/wiki/Behavior-driven_development)

## What's this?
**_Scenarios_** is a framework to support [Behavior Driven Development](https://en.wikipedia.org/wiki/Behavior-driven_development) (BDD) and [Acceptance Test Driven Development](https://en.wikipedia.org/wiki/Acceptance_test-driven_development) (ATDD) in [Pharo](https://www.pharo.org).

As of 12 December 2023, it implements the bare minimum to allow people to get started.

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
```

### Defining steps
Steps will then be **defined** in a separate class from the feature class. This class will need to be a subclass of `ScenarioStepDefinition`.

```Smalltalk
ScenarioStepDefinition subclass: #SampleStepDefinitions
	instanceVariableNames: ''
	classVariableNames: ''
	package: 'Scenarios-Tests-Sample'
```

Each step can be defined in its own method tagged with one of the #`Given:`, `#When:`, or `#Then:` pragmas:

```Smalltalk
failingScenario
	<Then: 'The scenario could fail'>
	self assert: false
```

### Running features and scenarios
At the moment, there is a SimpleScenarioRunner that needs to be triggered from a Playground.

To execute all Features, evaluate 

```Smalltalk
SimpleScenarioRunner new runAllFeatures 
```

in a Playground. 

To execute only one `Feature`, send #run to a class instance. 
Example: evaluate 

```Smalltalk
SampleFeature new run
``` 

in a Playground to execute all scenarios in class `SampleFeature`.
