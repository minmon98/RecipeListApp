# RecipeListApp
Application to get recipe list

## Architecture
This application applies MVI architecture, with:
- Intent receives an event from View and communicates with the business logic
- Model receives data from Intent and prepares it for display. The Model also keeps the current state of the View.
- View displays the prepared data.

![architecture](https://github.com/minmon98/RecipeListApp/blob/main/Resources/architecture.png)

![architecture diagram](https://github.com/minmon98/RecipeListApp/blob/main/Resources/architecture_diagram.webp)

## Unit test
Unit test for intent file

![code coverage](https://github.com/minmon98/RecipeListApp/blob/main/Resources/code_coverage.png)
Code coverage

![test cases](https://github.com/minmon98/RecipeListApp/blob/main/Resources/test_case.png)
Test cases

## Demo
![demo](https://github.com/minmon98/RecipeListApp/blob/main/Resources/demo.gif)
