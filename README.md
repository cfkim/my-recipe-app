# Recipe API Browser Swift App
I built this app to submit for Fetch's IOS Coding Challenge. Though I've had prior experience with building Kotlin and Flutter apps, I had not previously worked with Swift. Throughout building this recipe app, I've had the pleasure of learning Swift and API integration and growing my skillset. This app allows users to browse a wide selection of recipes and favorite them for later viewing. The recipe data was obtained with the following API: 
https://themealdb.com/api.php

## Built with
This app was built using Swift. Swift is an open-source programming language used to build applications for Apple platforms. It has many strengths including ease of use, memory management, safety, speed, and a large open-source community. To handle the API calls, this project utilizes Swift's concurrency with async/await. Additionally, to store a list of the user's favorite recipes locally with concise and readable code, the property wrapper, App Storage, is used. It allows for effective state management by automatically rebuilding any views that use it whenever its state changes.

## Getting Started
To run this app on your own development environment, you need to have XCode installed. It usually already comes preinstalled on Mac devices. The most current version (as of writing, v15.4) should be able to run this application.
1. Open XCode
2. Select "Clone Github Repository"
   <img width="494" alt="Screenshot 2024-07-19 at 7 25 11 PM" src="https://github.com/user-attachments/assets/c1d848a1-74c9-416e-96a7-b48b338cacc4">
3. Paste in the repository URL
   <img width="702" alt="Screenshot 2024-07-19 at 7 26 00 PM" src="https://github.com/user-attachments/assets/69e758a8-985c-4d15-8f75-b62ab7f4ff14">
5. Click "Clone"
6. In your IDE, at the top (see screenshot) select a device to run the app on. IPhone 15 and up are good choices.
   <img width="357" alt="Screenshot 2024-07-19 at 7 29 09 PM" src="https://github.com/user-attachments/assets/70c84061-d547-4a2e-a159-572e7dd0fbf4">
7. To preview certain screens, open the preview tab (control + option + p)
8. To build the application and run it on the actual emulator, click the play button at the top or (command + b)

### Installation
You only need to have XCode to run this app. There are no external libraries or packages that need to be downloaded to run this app.

## Usage
The app is intuitive and easy to use. When the app first runs, it opens up to the main view which is a tab view of three different views:
### 1) Recipe list view
- Select a category for the recipes from the picker at the top. The default is the Dessert category to show fulfillment of guidelines for a coding challenge.
- You can scroll through the various recipes fetched from the API for that category.
- You can tap on the recipe card to open a detail view which displays its ingredients and instructions for how to make it.
### 2) Search view
- Tap the search bar at the top to find a specific recipe by its name.
- Like the recipe list view, tapping on a result will bring you to its detail view.
### 3) Favorites view
- This shows all the recipes that you've favorited so far.
- Tapping on a recipe here will also bring you its detail view.
### Other notes
#### Detail view
This is not a separate tab in the tab view but all three views above can navigate to this view from a user tapping on a specific recipe.
- This displays the name of the recipe that you clicked on and its details.
- It also allows you to favorite the recipe for bookmarking.
#### Recipe Cards
This is how the recipe results are represented. This displays the recipe's image and name, as well as whether you've favorited it or not, indicated by a heart image; a filled in heart indicates that you've favorited it.

## Roadmap
Here's a roadmap for future releases.

## Support
Although I've had experience building mobile applications in Kotlin and Flutter from my Mobile Application Development class in university, I have not yet used Swift before building this app. The general principles learned from other languages like state management, views, and models helped in quickly picking up Swift. However, the following resources helped me to understand the language more, in addition to getting used to new syntax:

### For UI components:
- [Apple Developer Docs - SwiftUI](https://developer.apple.com/documentation/swiftui)
- [Hacking with Swift](https://www.hackingwithswift.com/quick-start/swiftui/building-a-menu-using-list)
### Understanding SwiftUI App architecture:
- [To Do List App tutorial - IOS Academy](https://www.youtube.com/watch?v=t_mypMqSXNw)
### API Integration
- [Swift API Calls with Async await explanation](https://www.youtube.com/watch?v=ERr0GXqILgc)
## Authors and Acknowledgements
I attribute the idea for using [https://themealdb.com/api.php](theMealDB) API from Fetch's IOS Coding challenge. 
