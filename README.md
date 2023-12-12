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
