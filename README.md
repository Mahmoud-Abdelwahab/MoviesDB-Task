
Simple MovieDB App
This is a simple iOS application that allows users to browse trending movies and view their details. It features pagination for seamless scrolling and includes a local search functionality for finding movies quickly.

Features
Listing all Trending Movies
Show Movie Details
Pagination enabled for endless scrolling
Local search for movies
Tools
Xcode 15.0.1
GitHub
Architecture
The app follows the MVVM (Model-View-ViewModel) architecture, which is well-suited for SwiftUI. It ensures separation of concerns and facilitates future updates, such as real-time updates for favorite/unfavorite movies.

Key Components:
ViewModel: Contains the presentation logic and interacts with the model to fetch and manage data.
Model: Represents the data and business logic of the application.
Repository: Acts as a middleman between the ViewModel and data sources. It determines whether to fetch data from a remote API or a local data source (e.g., cache).
Principles:
SOLID: The app follows SOLID principles to ensure code maintainability and extensibility.
Clean Code: Emphasis is placed on writing clean, readable, and maintainable code.
Testing
The project includes simple mocks and unit tests to ensure the correctness of critical components.