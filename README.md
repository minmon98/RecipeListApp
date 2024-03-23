# RecipeListApp
Application to get recipe list

## Architecture
This application applies MVI architecture, with:
- Intent receives an event from View and communicates with the business logic
- Model receives data from Intent and prepares it for display. The Model also keeps the current state of the View.
- View displays the prepared data.

![architecture](../RecipeListApp/Resources/architecture.png)

![architecture diagram](../RecipeListApp/Resources/architecture_diagram.webp)

## Unit test
Unit test for intent file

![code coverage](../RecipeListApp/Resources/code_coverage.png)
Code coverage

![test cases](../RecipeListApp/Resources/test_case.png)
Test cases

## Demo
![demo](../RecipeListApp/Resources/demo.gif)