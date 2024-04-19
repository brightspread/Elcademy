# Elcademy
 Implemented the home screen for Academy institutions on the Elice platform

## Contents
- About this project
- Requirements
- Concept
- Architecture
- Dependencies

## About the project
- In this app, you can *scroll* through recommended courses, free courses, and *sign up* for courses.

## Concept
- This app uses Elice's API to provide a list of subjects.
- Each course list **scrolls infinitely** to the right to provide a list of courses.
- Selecting a course will take you to the details page, where you can **sign up** for the course.

|List|Details|Enrollment|
|------|---|---|
|![Simulator Screen Recording - iPhone 15 - 2024-04-19 at 21 07 27](https://github.com/brightspread/Elcademy/assets/59555700/c220cf84-0c22-4ced-b14b-d2e242987276)|![Simulator Screen Recording - iPhone 15 - 2024-04-19 at 21 07 53](https://github.com/brightspread/Elcademy/assets/59555700/44d88c1c-e77e-420f-b0a7-787aa5b24687)|![Simulator Screen Recording - iPhone 15 - 2024-04-19 at 21 08 24](https://github.com/brightspread/Elcademy/assets/59555700/42991583-ec53-47af-9d63-4c18ff5b0d21)|

## Solutions for the project
- **Clean architecture** for readability and maintainability
- To keep the View code clean, I extracted most of the elements to the **Subview**.
- I split it into main and feat branches and used squash merges.

## Architecture
![CleanArchitecture+MVVM](https://github.com/brightspread/Elcademy/assets/59555700/7798b6d7-6939-4342-a918-edf820ee3df3)

### Layers
- Domain Layer = Entities + Use Cases + Repositories Interfaces
- Data Repositories Layer = Repositories Implementations + API (Network) + Persistence DB (AppStorage)
- Presentation Layer (MVVM) = ViewModels + Views

### Dependency Direction
![CleanArchitectureDependencies](https://github.com/brightspread/Elcademy/assets/59555700/c3f53407-ebe5-4252-aeec-9b03892f12e1)

### Dependencies
- Combine
- Moya
- Then
- Swift-Markdown-UI
