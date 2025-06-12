<p align="center">
  <img src="assets/flutterproject-banner.svg" alt="api_basket-banner" width="800">
</p>

<p align="center">
	<img src="https://img.shields.io/github/license/keylian15/flutterproject?style=flat&logo=opensourceinitiative&logoColor=white&color=00e9ff" alt="license">
	<img src="https://img.shields.io/github/last-commit/keylian15/flutterproject?style=flat&logo=git&logoColor=white&color=00e9ff" alt="last-commit">
	<img src="https://img.shields.io/github/languages/top/keylian15/flutterproject?style=flat&color=00e9ff" alt="repo-top-language">
	<img src="https://img.shields.io/github/languages/count/keylian15/flutterproject?style=flat&color=00e9ff" alt="repo-language-count">
</p>
<p align="center">Built with the tools and technologies:
	<img src="https://img.shields.io/badge/Dart-0175C2.svg?style=flat&logo=Dart&logoColor=white" alt="Dart">
	</p>
<br>

## Table of Contents

- [ Overview](#overview)
- [ Features](#features)
- [ Project Structure](#project-structure)
- [ Getting Started](#getting-started)
  - [ Prerequisites](#prerequisites)
  - [ Installation](#installation)
  - [ Usage](#usage)
  - [ Testing](#testing)
- [ Contributing](#contributing)
- [ Acknowledgments](#acknowledgments)

---
## Overview

This Flutter application is inspired by the Minecraft universe and allows users to browse all the items from the game along with their crafting methods. It features a simple, intuitive, and smooth interface designed to make searching for and viewing crafting recipes easy.  
The app includes three main pages: the item list, the craft detail page, and a favorites page.

---

## Features

- **Item List**  
  A dedicated page displaying all Minecraft items. It includes:

  - A **search bar** to filter items by name.
  - **Clicking on an item** redirects to its craft page.

- **Craft Page**  
  This page displays:

  - The **complete crafting recipe** of the selected item (crafting grid or other visual representation).
  - A **button to add or remove the item from favorites**.

- **Favorites Page**  
  This page displays:
  - A list of all **items added to favorites**.
  - Same functionality as the item list (search + redirection to the craft page).
  - On the craft page accessed from favorites, the add button is replaced by a **remove from favorites** button.

---


## Project Structure

```sh
└── flutterproject/
    ├── README.md
    ├── analysis_options.yaml
    ├── android
    │   ├── .gitignore
    │   ├── app
    │   ├── build.gradle
    │   ├── gradle
    │   ├── gradle.properties
    │   └── settings.gradle
    ├── assets
    │   └── images
    ├── devtools_options.yaml
    ├── ios
    │   ├── .gitignore
    │   ├── Flutter
    │   ├── Runner
    │   ├── Runner.xcodeproj
    │   ├── Runner.xcworkspace
    │   └── RunnerTests
    ├── lib
    │   ├── Store
    │   ├── block_data.dart
    │   ├── helper
    │   ├── main.dart
    │   ├── models
    │   ├── pages
    │   └── widget
    ├── linux
    │   ├── .gitignore
    │   ├── CMakeLists.txt
    │   ├── flutter
    │   └── runner
    ├── macos
    │   ├── .gitignore
    │   ├── Flutter
    │   ├── Runner
    │   ├── Runner.xcodeproj
    │   ├── Runner.xcworkspace
    │   └── RunnerTests
    ├── pubspec.lock
    ├── pubspec.yaml
    ├── test
    │   └── widget_test.dart
    ├── web
    │   ├── favicon.png
    │   ├── icons
    │   ├── index.html
    │   └── manifest.json
    └── windows
        ├── .gitignore
        ├── CMakeLists.txt
        ├── flutter
        └── runner
```

---

## Getting Started

### Prerequisites

Before getting started with flutterproject, ensure your runtime environment meets the following requirements:

- **Programming Language:** Dart
- **Package Manager:** Pub, Gradle, Cmake

### Installation

Install flutterproject using one of the following methods:

**Build from source:**

1. Clone the flutterproject repository:

```sh
❯ git clone https://github.com/keylian15/flutterproject
```

2. Navigate to the project directory:

```sh
❯ cd flutterproject
```

3. Install the project dependencies:

**Using `pub`** &nbsp; [<img align="center" src="https://img.shields.io/badge/Dart-0175C2.svg?style={badge_style}&logo=dart&logoColor=white" />](https://dart.dev/)

```sh
❯ pub get
```

### Usage

Run flutterproject using the following command:
**Using `pub`** &nbsp; [<img align="center" src="https://img.shields.io/badge/Dart-0175C2.svg?style={badge_style}&logo=dart&logoColor=white" />](https://dart.dev/)

```sh
❯ dart {entrypoint}
```

### Testing

Run the test suite using the following command:
**Using `pub`** &nbsp; [<img align="center" src="https://img.shields.io/badge/Dart-0175C2.svg?style={badge_style}&logo=dart&logoColor=white" />](https://dart.dev/)

```sh
❯ pub run test
```

---

## Contributing

- **💬 [Join the Discussions](https://github.com/keylian15/flutterproject/discussions)**: Share your insights, provide feedback, or ask questions.
- **🐛 [Report Issues](https://github.com/keylian15/flutterproject/issues)**: Submit bugs found or log feature requests for the `flutterproject` project.

<details closed>
<summary>Contributing Guidelines</summary>

1. **Fork the Repository**: Start by forking the project repository to your github account.
2. **Clone Locally**: Clone the forked repository to your local machine using a git client.
   ```sh
   git clone https://github.com/keylian15/flutterproject
   ```
3. **Create a New Branch**: Always work on a new branch, giving it a descriptive name.
   ```sh
   git checkout -b new-feature-x
   ```
4. **Make Your Changes**: Develop and test your changes locally.
5. **Commit Your Changes**: Commit with a clear message describing your updates.
   ```sh
   git commit -m 'Implemented new feature x.'
   ```
6. **Push to github**: Push the changes to your forked repository.
   ```sh
   git push origin new-feature-x
   ```
7. **Submit a Pull Request**: Create a PR against the original project repository. Clearly describe the changes and their motivations.
8. **Review**: Once your PR is reviewed and approved, it will be merged into the main branch. Congratulations on your contribution!
</details>

<details closed>
<summary>Contributor Graph</summary>
<br>
<p align="left">
   <a href="https://github.com/keylian15/flutterproject/graphs/contributors">
      <img src="https://contrib.rocks/image?repo=keylian15/flutterproject">
   </a>
</p>
</details>

---

## Acknowledgments

<a href="https://github.com/keylian15/flutterproject/graphs/contributors">
	<img src="https://contrib.rocks/image?repo=keylian15/flutterproject">
</a>

_This documentation was generated using [readme-ai](https://readme-ai.streamlit.app)._
