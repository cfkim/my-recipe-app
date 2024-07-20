# Recipe API Browser Swift App 🧁
This app allows users to browse a wide selection of recipes under different categories and favorite specific ones for later viewing. The recipe data was obtained with [theMealDB API](https://themealdb.com/api.php). It also allows you to view the recipe details.
  
## Built with
This app was built using Swift. Swift is an open-source programming language used to build applications for Apple platforms. It has many strengths as a language including ease of use due to simple syntax, effective memory management, faster performance speed, and a large open-source community. To handle the API calls, this project utilizes Swift's concurrency with async/await. Additionally, to store a list of the user's favorite recipes locally with concise and readable code, the property wrapper, AppStorage, is used. AppStorage allows for effective state management by automatically rebuilding any views that rely on it whenever its state changes.

## Getting Started
To run this app on your own development environment, you need to have XCode installed. It usually already comes preinstalled on Mac devices. The most current version (as of writing, v15.4) should be able to run this application.
1. Open XCode
2. Select "Clone Github Repository"
   <p align="center">
   <img width="494" alt="Screenshot 2024-07-19 at 7 25 11 PM" src="https://github.com/user-attachments/assets/c1d848a1-74c9-416e-96a7-b48b338cacc4">
   </p>
4. Paste in the repository URL
   <p align="center">
   <img width="702" alt="Screenshot 2024-07-19 at 7 26 00 PM" src="https://github.com/user-attachments/assets/69e758a8-985c-4d15-8f75-b62ab7f4ff14">
   </p>
6. Click "Clone"
7. In your IDE, at the top (see screenshot below), select a device to run the app on. Any of the IPhone options that appear are sufficient.
   <p align="center">
   <img width="350" alt="Screenshot 2024-07-19 at 8 37 36 PM" src="https://github.com/user-attachments/assets/b21acdc9-4aa9-4053-a586-bbb49a90cc88">
   </p>
9. To preview certain screens, open the preview tab (control + option + p) while the view's corresponding file is open in the editor. A new panel should pop-up with an IPhone within the window.
10. To build the application and run it on the actual simulator, click the play button at the top or (command + b)

### Installation
You only need to have XCode to run this app. There are no external libraries or packages that need to be downloaded to run this app.

## Usage
The app is intuitive and easy to use. When the app first runs, it opens up to a tab view of three different views:
### 1) Recipe list view (default)
- Select a category for the recipes from the picker at the top.
- You can scroll through the various recipes fetched from the API for that category.
- You can tap on the recipe card to open a detail view which displays its ingredients and instructions for how to make it.
### 2) Search view
- Tap the search bar at the top to find a specific recipe by its name.
- Like the recipe list view, tapping on a result will bring you to its detail view.
### 3) Favorites view
- This shows all the recipes that you've favorited so far.
- Tapping on a recipe here will also bring you to its detail view.
### Other notes
#### 1) Detail view
This is not a separate tab in the main view but all three views above can navigate to this view from a user tapping on a specific recipe.
- This displays the name of the recipe that you clicked on and its details.
- It also allows you to favorite the recipe for bookmarking.
#### 2) Recipe Cards
This is how the recipe results are represented. This displays the recipe's image and name, as well as whether you've favorited it or not, indicated by a heart image; a filled in heart indicates that you've favorited it.

## Roadmap
Here are some ways that this app can be further developed or improved:
- [ ] Add user management - create a more personalized experience and allow for more complex data storage. Possibly by integrating Firebase.
   - [ ] Allow users to rate and comment on recipes and see others' comments.
   - [ ] Allow users to record notes for a recipe.
- [ ] Update color scheme and app design with more cohesive branding using tools like Figma to plan.
- [ ] Be able to filter recipes by ingredients in the search view.
- [ ] Add link to a recipe's YouTube video.

## Support
Although I've had experience building mobile applications in Kotlin and Flutter from my Mobile Application Development class in university, I have not yet used Swift before building this app. The general principles learned from other languages like state management, views, and models helped in quickly picking up Swift. However, the following resources helped me to understand the language more, in addition to getting used to new syntax:

### For UI components:
- [Apple Developer Docs - SwiftUI](https://developer.apple.com/documentation/swiftui)
- [Hacking with Swift](https://www.hackingwithswift.com/quick-start/swiftui/building-a-menu-using-list)
### Understanding SwiftUI App architecture:
- [To Do List App tutorial - IOS Academy](https://www.youtube.com/watch?v=t_mypMqSXNw)
### API Integration:
- [Swift API Calls with Async await explanation](https://www.youtube.com/watch?v=ERr0GXqILgc)
## Authors and Acknowledgements
I attribute the idea for using [https://themealdb.com/api.php](theMealDB) API from Fetch's IOS Coding challenge. 
