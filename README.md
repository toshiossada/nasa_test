# Project Name NASA APOD

![nasa](https://github.com/user-attachments/assets/50183e03-cf65-4075-be7c-ce0625ead770)

This project is a Flutter application built using Clean Architecture and a modular design.

## Getting Started

### Prerequisites

* Flutter SDK installed (version 3.29.0 or higher recommended)
* An Android or iOS development environment set up

### Installation

1 -  Clone the repository:

    git clone <repository_url>

2 -  Navigate to the project directory:

    cd <project_directory>

3 -  Install dependencies:

    flutter pub get

### Running the Application

To run the application:

1 -  Create a `.env` file in the project root to store your environment variables as `.env_example`.
    API_KEY={API_KEY}

2 -  Run the app `build_runner`:

    flutter build_runner build

2 -  Run the app:
    flutter run

## Testing

### Unit and Widget Tests

To execute all unit and widget tests:

    flutter test --concurrency=1

### Integration Test

To execute all integration tests:

    flutter test integration_test/

## ARCHTECTURE

To know more about archtecture of project [CHECK OUT](ARCHTECTURE.md)
