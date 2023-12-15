# Scenarios

## What's this?
_Scenarios_ is a framework to support [Behavior Driven Development](https://en.wikipedia.org/wiki/Behavior-driven_development) (BDD) and [Acceptance Test Driven Development](https://en.wikipedia.org/wiki/Acceptance_test-driven_development) (ATDD) in Pharo.

As of 12 December 2023, it implements the bare minimum to allow people to get started.

The long term plan is to develop the framework to support most if not all features of [Cucumber](https://cucumber.io/), including support for Cucumber's [Gerkhin](https://cucumber.io/docs/gherkin/) language.

## Installing
To install the library, execute the following code in a workspace:

```smalltalk
Metacello new
    repository: 'github://gcorriga/Scenarios:main/src';
    baseline: 'Scenarios';
    load
```

## Creating features and scenarios
To create a new Feature, create a new class with `Feature` as its superclass.

To add a scenario, add a new method to the class and tag it with the `#Scenario:` pragma. The pragma takes one argument which will be the title of the scenario.
Scenario steps are declared by sending the `#given:`, `#when:`, and `#then:` messages.

## Defining steps
Steps will be defined in a separate class from the feature. This class will need to be a subclass of `ScenarioStepDefinition`.

Each step can be defined in its own method tagged with one of the #`Given:`, `#When:`, or `#Then:` pragmas.

## Running features and scenarios
At the moment, there is a SimpleScenarioRunner that needs to be triggered from a Playground.

To execute all Features, evaluate `SimpleScenarioRunner new runAllFeatures` in a Playground.
To execute only one Feature, send `#run` to a class instance. Example: evaluate `TestFeature new run` in a Playground to execute all scenarios in class `TestFeature`.
