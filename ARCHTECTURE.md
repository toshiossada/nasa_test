# Architecture Overview

This document outlines the architecture of the project, which is structured using Clean Architecture principles and a modular design.

**Overall Architecture**

![Architecture Diagram](https://github.com/toshiossada/weather_test/assets/2637049/e336557f-ef0a-400b-a62d-64792e0fe984)

The architecture is divided into distinct modules to promote separation of concerns, maintainability, and testability.

![Modular Architecture Diagram](https://github.com/toshiossada/weather_test/assets/2637049/4b06aee9-a2d3-40f9-80f2-513a31eb5ded)

## Core Module

![Core Module Diagram](https://github.com/toshiossada/weather_test/assets/2637049/5c7db08f-a201-41ca-aa69-3d55201dde3e)

The `Core Module` contains reusable components that are shared across all other modules. This includes:

* **Adapters:** Interfaces with external systems (e.g., HTTP clients).
* **Extensions:** Utility functions extending existing classes or functionalities.
* **Helpers:** Common utility functions and classes.

## Home Module

The `Home Module` demonstrates a Clean Architecture implementation, organized into the following layers:

* **Domain:** Business logic and rules.
* **Infrastructure (Infra):** Implementation details for external interactions.
* **Presentation:** User interface and user interaction handling.

![Home Module Architecture Diagram](https://github.com/user-attachments/assets/33e689cb-b91d-4554-8722-58bed5bad93b)

### Domain Layer

![Domain Layer Diagram](https://github.com/user-attachments/assets/2ebc0a92-a18f-4259-80ad-3dafc5970578)

The `Domain Layer` defines the core business logic and is independent of any specific implementation details. It includes:

* **Enums:** Definitions of specific data types with limited values.
* **Repository Interfaces:** Abstract definitions of data access operations.
* **Entities:** Core data structures representing business objects.
* **Use Cases:** Specific business operations or actions.

### Infrastructure (Infra) Layer

The `Infrastructure Layer` provides concrete implementations for the interfaces defined in the Domain Layer.

#### Data Source

![Data Source Diagram](https://github.com/user-attachments/assets/fd0e1d66-ed9a-47a1-a701-b18b30a0cc74)

The `Data Source` is responsible for fetching data from external sources, such as APIs. It utilizes the `HttpAdapter` (from the Core Module) to make API requests.

#### Repositories

![Repositories Diagram](https://github.com/user-attachments/assets/4d242f34-5cc0-4435-8c88-95344d8ed3fa)

`Repositories` act as an intermediary between the `Use Cases` (in the Domain Layer) and the `Data Sources`. They are responsible for:

* Implementing the repository interfaces.
* Retrieving data from the `Data Source`.
* Converting data `Models` (from the Data Source) into `Entities` (from the Domain Layer) using `Mappers`.

### Presentation Layer

![Presentation Layer Diagram](https://github.com/toshiossada/weather_test/assets/2637049/61c5da2c-a57b-4aba-bca8-231503bb5504)

The `Presentation Layer` is responsible for handling the user interface and user interactions. It is structured into:

* **Pages:** Specific screens or views within the application.
* **Stores:** State management components.
* **Controllers:** Logic handlers for user interactions and data flow.
* **Widgets:** Reusable UI components.

`Stores, Widgets, and Controllers` located outside of the `Pages` directory are designed to be reusable across multiple presentations.

![Shared Components Diagram](https://github.com/toshiossada/weather_test/assets/2637049/673c197f-dfa3-4ea9-b8a2-4972ef2f55a1)

#### Pages

![Page Structure Diagram](https://github.com/toshiossada/weather_test/assets/2637049/593da6cd-740e-48be-bb91-1c39bf1a74da)

Each `Page` is typically associated with a `Controller` to manage its logic.  A page may also utilize a `Store` for state management and incorporate one or more `Widgets` for UI composition.