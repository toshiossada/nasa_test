# NASA APOD

![nasa](https://github.com/user-attachments/assets/50183e03-cf65-4075-be7c-ce0625ead770)

This project is a Flutter application built using Clean Architecture and a modular design.
https://dog-devourer-a69.notion.site/Flutter-15a3dbe33057802f98e1f732565b52b2

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

1 - Register on <https://api.nasa.gov/> to get you API_KEY

2 -  Create a `.env` file in the project root to store your environment variables as `.env_example`.
    API_KEY={API_KEY}

3 -  Run the app `build_runner`:

    flutter build_runner build

4 -  Run the app:
    flutter run

## Testing

### Unit and Widget Tests

To execute all unit and widget tests:

    flutter test --concurrency=1

### Integration Test

To execute all integration tests:

    flutter test integration_test/

### Integration Tests with Maestro

This guide describes how to execute integration tests using Maestro to verify application functionality.

> Prerequisites

1 -  **Maestro Installed:**
    *Ensure Maestro is correctly installed. Follow the detailed instructions at [https://docs.maestro.dev/getting-started/installing-maestro](https://docs.maestro.dev/getting-started/installing-maestro).
    * Verify that Maestro is accessible in your PATH by running `maestro --version` in the terminal.

2 -  **Configured Android Environment:**
    *Have the Android SDK and command-line tools (adb) configured on your system.
    * An Android emulator or a physical device connected and configured for USB debugging.

3 -  **Flutter SDK Installed:**
    * Ensure the Flutter SDK is installed and configured correctly.

> Running the Tests

1 -  **Building the Release APK:**
    * Execute the following command to build the release APK of your Flutter application:

    flutter build apk --release

* This command creates an optimized APK for production, located at `build/app/outputs/flutter-apk/app-release.apk`.

2 -  **Installing the APK on the Device/Emulator:**
    * Install the APK on your Android device or emulator using adb:

    adb install build/app/outputs/flutter-apk/app-release.apk

* If you are reinstalling the application, you may need to use the command `adb install -r build/app/outputs/flutter-apk/app-release.apk` to reinstall over the existing version.

1 - **Executing Maestro Tests:**
    * Execute the integration tests defined in the `maestro/flows.yaml` file with the following command:

    maestro test maestro/flows.yaml


    * Maestro will execute the steps defined in `flows.yaml` on the connected device/emulator, simulating user interaction and verifying application behavior.

## `flows.yaml` File Structure

* The `maestro/flows.yaml` file contains the definition of your integration tests. Ensure it is correctly structured and covers the desired test scenarios.
* Examples and documentation on the `flows.yaml` syntax can be found in the Maestro documentation.

## ARCHTECTURE

To know more about archtecture of project [CHECK OUT](ARCHTECTURE.md)
