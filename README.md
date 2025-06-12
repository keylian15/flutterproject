<p align="center">
	<img src="data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0idXRmLTgiPz4KICAgIDxzdmcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2aWV3Qm94PSIwIDAgODAwIDIwMCI+CiAgICAgICAgPGRlZnM+CiAgICAgICAgICAgIDxsaW5lYXJHcmFkaWVudCBpZD0iYmctZ3JhZGllbnQiIHgxPSIwJSIgeTE9IjAlIiB4Mj0iMTAwJSIgeTI9IjEwMCUiPgogICAgICAgICAgICAgICAgPHN0b3Agb2Zmc2V0PSIwJSIgc3R5bGU9InN0b3AtY29sb3I6IzQxNThEMDtzdG9wLW9wYWNpdHk6MSIgLz4KICAgICAgICAgICAgICAgIDxzdG9wIG9mZnNldD0iNTAlIiBzdHlsZT0ic3RvcC1jb2xvcjojQzg1MEMwO3N0b3Atb3BhY2l0eToxIiAvPgogICAgICAgICAgICAgICAgPHN0b3Agb2Zmc2V0PSIxMDAlIiBzdHlsZT0ic3RvcC1jb2xvcjojRkZDQzcwO3N0b3Atb3BhY2l0eToxIiAvPgogICAgICAgICAgICA8L2xpbmVhckdyYWRpZW50PgogICAgICAgICAgICA8ZmlsdGVyIGlkPSJzaGFkb3ciPgogICAgICAgICAgICAgICAgPGZlRHJvcFNoYWRvdyBkeD0iMCIgZHk9IjQiIHN0ZERldmlhdGlvbj0iNCIgZmxvb2Qtb3BhY2l0eT0iMC4yNSIgLz4KICAgICAgICAgICAgPC9maWx0ZXI+CiAgICAgICAgPC9kZWZzPgogICAgICAgIDxyZWN0IHdpZHRoPSI4MDAiIGhlaWdodD0iMjAwIiBmaWxsPSJ1cmwoI2JnLWdyYWRpZW50KSIgcng9IjE1IiByeT0iMTUiLz4KICAgICAgICA8dGV4dCB4PSI0MDAiIHk9IjEwMCIgZm9udC1mYW1pbHk9IkFyaWFsLCBzYW5zLXNlcmlmIiBmb250LXNpemU9IjQ4IgogICAgICAgIGZvbnQtd2VpZ2h0PSJib2xkIiB0ZXh0LWFuY2hvcj0ibWlkZGxlIiBkb21pbmFudC1iYXNlbGluZT0ibWlkZGxlIgogICAgICAgIGZpbGw9IiNGRkZGRkYiIGZpbHRlcj0idXJsKCNzaGFkb3cpIj5GTFVUVEVSUFJPSkVDVDwvdGV4dD4KICAgIDwvc3ZnPg==" alt="flutterproject-banner" width="800">
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

- [ Overview](#-overview)
- [ Features](#-features)
- [ Project Structure](#-project-structure)
  - [ Project Index](#-project-index)
- [ Getting Started](#-getting-started)
  - [ Prerequisites](#-prerequisites)
  - [ Installation](#-installation)
  - [ Usage](#-usage)
  - [ Testing](#-testing)
- [ Project Roadmap](#-project-roadmap)
- [ Contributing](#-contributing)
- [ License](#-license)
- [ Acknowledgments](#-acknowledgments)

---

## Overview

Cette application Flutter s'inspire de l'univers de Minecraft et permet aux utilisateurs de consulter les différents items du jeu ainsi que leur méthode de fabrication (craft). Elle propose une interface simple, intuitive et fluide, conçue pour faciliter la recherche et la consultation des recettes de craft.  
L'application comprend trois pages principales : la liste des items, la page de détails du craft, et une page dédiée aux favoris.

---

## Features

- **Liste des items**  
  Une page dédiée affichant tous les items du jeu Minecraft. Elle inclut :

  - Une **barre de recherche** pour filtrer les items par nom.
  - Un **clic sur un item** redirige vers sa page de craft.

- **Page de craft**  
  Cette page affiche :

  - Le **craft complet** de l’item sélectionné (grille de crafting ou autre présentation visuelle).
  - Un **bouton pour ajouter ou retirer l’item des favoris**.

- **Page de favoris**  
  Cette page affiche :
  - Liste tous les **items ajoutés en favoris**.
  - Même fonctionnement que la liste d’items classique (recherche + redirection vers la page de craft).
  - Sur la page de craft ouverte depuis les favoris, le bouton d’ajout est remplacé par un bouton de suppression des favoris.

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

### Project Index

<details open>
	<summary><b><code>FLUTTERPROJECT/</code></b></summary>
	<details> <!-- __root__ Submodule -->
		<summary><b>__root__</b></summary>
		<blockquote>
			<table>
			<tr>
				<td><b><a href='https://github.com/keylian15/flutterproject/blob/master/analysis_options.yaml'>analysis_options.yaml</a></b></td>
			</tr>
			<tr>
				<td><b><a href='https://github.com/keylian15/flutterproject/blob/master/pubspec.yaml'>pubspec.yaml</a></b></td>
			</tr>
			<tr>
				<td><b><a href='https://github.com/keylian15/flutterproject/blob/master/devtools_options.yaml'>devtools_options.yaml</a></b></td>
			</tr>
			</table>
		</blockquote>
	</details>
	<details> <!-- ios Submodule -->
		<summary><b>ios</b></summary>
		<blockquote>
			<details>
				<summary><b>Runner.xcworkspace</b></summary>
				<blockquote>
					<table>
					<tr>
						<td><b><a href='https://github.com/keylian15/flutterproject/blob/master/ios/Runner.xcworkspace/contents.xcworkspacedata'>contents.xcworkspacedata</a></b></td>
					</tr>
					</table>
					<details>
						<summary><b>xcshareddata</b></summary>
						<blockquote>
							<table>
							<tr>
								<td><b><a href='https://github.com/keylian15/flutterproject/blob/master/ios/Runner.xcworkspace/xcshareddata/WorkspaceSettings.xcsettings'>WorkspaceSettings.xcsettings</a></b></td>
							</tr>
							<tr>
								<td><b><a href='https://github.com/keylian15/flutterproject/blob/master/ios/Runner.xcworkspace/xcshareddata/IDEWorkspaceChecks.plist'>IDEWorkspaceChecks.plist</a></b></td>
							</tr>
							</table>
						</blockquote>
					</details>
				</blockquote>
			</details>
			<details>
				<summary><b>Runner.xcodeproj</b></summary>
				<blockquote>
					<table>
					<tr>
						<td><b><a href='https://github.com/keylian15/flutterproject/blob/master/ios/Runner.xcodeproj/project.pbxproj'>project.pbxproj</a></b></td>
					</tr>
					</table>
					<details>
						<summary><b>xcshareddata</b></summary>
						<blockquote>
							<details>
								<summary><b>xcschemes</b></summary>
								<blockquote>
									<table>
									<tr>
										<td><b><a href='https://github.com/keylian15/flutterproject/blob/master/ios/Runner.xcodeproj/xcshareddata/xcschemes/Runner.xcscheme'>Runner.xcscheme</a></b></td>
									</tr>
									</table>
								</blockquote>
							</details>
						</blockquote>
					</details>
					<details>
						<summary><b>project.xcworkspace</b></summary>
						<blockquote>
							<table>
							<tr>
								<td><b><a href='https://github.com/keylian15/flutterproject/blob/master/ios/Runner.xcodeproj/project.xcworkspace/contents.xcworkspacedata'>contents.xcworkspacedata</a></b></td>
							</tr>
							</table>
							<details>
								<summary><b>xcshareddata</b></summary>
								<blockquote>
									<table>
									<tr>
										<td><b><a href='https://github.com/keylian15/flutterproject/blob/master/ios/Runner.xcodeproj/project.xcworkspace/xcshareddata/WorkspaceSettings.xcsettings'>WorkspaceSettings.xcsettings</a></b></td>
									</tr>
									<tr>
										<td><b><a href='https://github.com/keylian15/flutterproject/blob/master/ios/Runner.xcodeproj/project.xcworkspace/xcshareddata/IDEWorkspaceChecks.plist'>IDEWorkspaceChecks.plist</a></b></td>
									</tr>
									</table>
								</blockquote>
							</details>
						</blockquote>
					</details>
				</blockquote>
			</details>
			<details>
				<summary><b>Flutter</b></summary>
				<blockquote>
					<table>
					<tr>
						<td><b><a href='https://github.com/keylian15/flutterproject/blob/master/ios/Flutter/AppFrameworkInfo.plist'>AppFrameworkInfo.plist</a></b></td>
					</tr>
					<tr>
						<td><b><a href='https://github.com/keylian15/flutterproject/blob/master/ios/Flutter/Debug.xcconfig'>Debug.xcconfig</a></b></td>
					</tr>
					<tr>
						<td><b><a href='https://github.com/keylian15/flutterproject/blob/master/ios/Flutter/Release.xcconfig'>Release.xcconfig</a></b></td>
					</tr>
					</table>
				</blockquote>
			</details>
			<details>
				<summary><b>RunnerTests</b></summary>
				<blockquote>
					<table>
					<tr>
						<td><b><a href='https://github.com/keylian15/flutterproject/blob/master/ios/RunnerTests/RunnerTests.swift'>RunnerTests.swift</a></b></td>
					</tr>
					</table>
				</blockquote>
			</details>
			<details>
				<summary><b>Runner</b></summary>
				<blockquote>
					<table>
					<tr>
						<td><b><a href='https://github.com/keylian15/flutterproject/blob/master/ios/Runner/Runner-Bridging-Header.h'>Runner-Bridging-Header.h</a></b></td>
					</tr>
					<tr>
						<td><b><a href='https://github.com/keylian15/flutterproject/blob/master/ios/Runner/AppDelegate.swift'>AppDelegate.swift</a></b></td>
					</tr>
					<tr>
						<td><b><a href='https://github.com/keylian15/flutterproject/blob/master/ios/Runner/Info.plist'>Info.plist</a></b></td>
					</tr>
					</table>
					<details>
						<summary><b>Assets.xcassets</b></summary>
						<blockquote>
							<details>
								<summary><b>LaunchImage.imageset</b></summary>
								<blockquote>
									<table>
									<tr>
										<td><b><a href='https://github.com/keylian15/flutterproject/blob/master/ios/Runner/Assets.xcassets/LaunchImage.imageset/Contents.json'>Contents.json</a></b></td>
									</tr>
									</table>
								</blockquote>
							</details>
							<details>
								<summary><b>AppIcon.appiconset</b></summary>
								<blockquote>
									<table>
									<tr>
										<td><b><a href='https://github.com/keylian15/flutterproject/blob/master/ios/Runner/Assets.xcassets/AppIcon.appiconset/Contents.json'>Contents.json</a></b></td>
									</tr>
									</table>
								</blockquote>
							</details>
						</blockquote>
					</details>
					<details>
						<summary><b>Base.lproj</b></summary>
						<blockquote>
							<table>
							<tr>
								<td><b><a href='https://github.com/keylian15/flutterproject/blob/master/ios/Runner/Base.lproj/Main.storyboard'>Main.storyboard</a></b></td>
							</tr>
							<tr>
								<td><b><a href='https://github.com/keylian15/flutterproject/blob/master/ios/Runner/Base.lproj/LaunchScreen.storyboard'>LaunchScreen.storyboard</a></b></td>
							</tr>
							</table>
						</blockquote>
					</details>
				</blockquote>
			</details>
		</blockquote>
	</details>
	<details> <!-- lib Submodule -->
		<summary><b>lib</b></summary>
		<blockquote>
			<table>
			<tr>
				<td><b><a href='https://github.com/keylian15/flutterproject/blob/master/lib/main.dart'>main.dart</a></b></td>
			</tr>
			<tr>
				<td><b><a href='https://github.com/keylian15/flutterproject/blob/master/lib/block_data.dart'>block_data.dart</a></b></td>
			</tr>
			</table>
			<details>
				<summary><b>pages</b></summary>
				<blockquote>
					<table>
					<tr>
						<td><b><a href='https://github.com/keylian15/flutterproject/blob/master/lib/pages/favoritePage.dart'>favoritePage.dart</a></b></td>
					</tr>
					<tr>
						<td><b><a href='https://github.com/keylian15/flutterproject/blob/master/lib/pages/CraftingPage.dart'>CraftingPage.dart</a></b></td>
					</tr>
					<tr>
						<td><b><a href='https://github.com/keylian15/flutterproject/blob/master/lib/pages/listItemPage.dart'>listItemPage.dart</a></b></td>
					</tr>
					</table>
				</blockquote>
			</details>
			<details>
				<summary><b>Store</b></summary>
				<blockquote>
					<table>
					<tr>
						<td><b><a href='https://github.com/keylian15/flutterproject/blob/master/lib/Store/app_store.dart'>app_store.dart</a></b></td>
					</tr>
					</table>
				</blockquote>
			</details>
			<details>
				<summary><b>models</b></summary>
				<blockquote>
					<table>
					<tr>
						<td><b><a href='https://github.com/keylian15/flutterproject/blob/master/lib/models/recipe_model.dart'>recipe_model.dart</a></b></td>
					</tr>
					</table>
				</blockquote>
			</details>
			<details>
				<summary><b>helper</b></summary>
				<blockquote>
					<table>
					<tr>
						<td><b><a href='https://github.com/keylian15/flutterproject/blob/master/lib/helper/api_helper.dart'>api_helper.dart</a></b></td>
					</tr>
					</table>
				</blockquote>
			</details>
			<details>
				<summary><b>widget</b></summary>
				<blockquote>
					<table>
					<tr>
						<td><b><a href='https://github.com/keylian15/flutterproject/blob/master/lib/widget/navBar_widget.dart'>navBar_widget.dart</a></b></td>
					</tr>
					<tr>
						<td><b><a href='https://github.com/keylian15/flutterproject/blob/master/lib/widget/searchBar_widget.dart'>searchBar_widget.dart</a></b></td>
					</tr>
					<tr>
						<td><b><a href='https://github.com/keylian15/flutterproject/blob/master/lib/widget/dioProvider.dart'>dioProvider.dart</a></b></td>
					</tr>
					<tr>
						<td><b><a href='https://github.com/keylian15/flutterproject/blob/master/lib/widget/blockWidget.dart'>blockWidget.dart</a></b></td>
					</tr>
					<tr>
						<td><b><a href='https://github.com/keylian15/flutterproject/blob/master/lib/widget/result_slot.dart'>result_slot.dart</a></b></td>
					</tr>
					<tr>
						<td><b><a href='https://github.com/keylian15/flutterproject/blob/master/lib/widget/crafting_slot.dart'>crafting_slot.dart</a></b></td>
					</tr>
					</table>
				</blockquote>
			</details>
		</blockquote>
	</details>
	<details> <!-- android Submodule -->
		<summary><b>android</b></summary>
		<blockquote>
			<table>
			<tr>
				<td><b><a href='https://github.com/keylian15/flutterproject/blob/master/android/build.gradle'>build.gradle</a></b></td>
			</tr>
			<tr>
				<td><b><a href='https://github.com/keylian15/flutterproject/blob/master/android/settings.gradle'>settings.gradle</a></b></td>
			</tr>
			</table>
			<details>
				<summary><b>app</b></summary>
				<blockquote>
					<table>
					<tr>
						<td><b><a href='https://github.com/keylian15/flutterproject/blob/master/android/app/build.gradle'>build.gradle</a></b></td>
					</tr>
					</table>
					<details>
						<summary><b>src</b></summary>
						<blockquote>
							<details>
								<summary><b>main</b></summary>
								<blockquote>
									<details>
										<summary><b>kotlin</b></summary>
										<blockquote>
											<details>
												<summary><b>com</b></summary>
												<blockquote>
													<details>
														<summary><b>example</b></summary>
														<blockquote>
															<details>
																<summary><b>flutterproject</b></summary>
																<blockquote>
																	<table>
																	<tr>
																		<td><b><a href='https://github.com/keylian15/flutterproject/blob/master/android/app/src/main/kotlin/com/example/flutterproject/MainActivity.kt'>MainActivity.kt</a></b></td>
																	</tr>
																	</table>
																</blockquote>
															</details>
														</blockquote>
													</details>
												</blockquote>
											</details>
										</blockquote>
									</details>
								</blockquote>
							</details>
						</blockquote>
					</details>
				</blockquote>
			</details>
		</blockquote>
	</details>
	<details> <!-- windows Submodule -->
		<summary><b>windows</b></summary>
		<blockquote>
			<table>
			<tr>
				<td><b><a href='https://github.com/keylian15/flutterproject/blob/master/windows/CMakeLists.txt'>CMakeLists.txt</a></b></td>
			</tr>
			</table>
			<details>
				<summary><b>flutter</b></summary>
				<blockquote>
					<table>
					<tr>
						<td><b><a href='https://github.com/keylian15/flutterproject/blob/master/windows/flutter/CMakeLists.txt'>CMakeLists.txt</a></b></td>
					</tr>
					<tr>
						<td><b><a href='https://github.com/keylian15/flutterproject/blob/master/windows/flutter/generated_plugin_registrant.cc'>generated_plugin_registrant.cc</a></b></td>
					</tr>
					<tr>
						<td><b><a href='https://github.com/keylian15/flutterproject/blob/master/windows/flutter/generated_plugin_registrant.h'>generated_plugin_registrant.h</a></b></td>
					</tr>
					<tr>
						<td><b><a href='https://github.com/keylian15/flutterproject/blob/master/windows/flutter/generated_plugins.cmake'>generated_plugins.cmake</a></b></td>
					</tr>
					</table>
				</blockquote>
			</details>
			<details>
				<summary><b>runner</b></summary>
				<blockquote>
					<table>
					<tr>
						<td><b><a href='https://github.com/keylian15/flutterproject/blob/master/windows/runner/flutter_window.h'>flutter_window.h</a></b></td>
					</tr>
					<tr>
						<td><b><a href='https://github.com/keylian15/flutterproject/blob/master/windows/runner/win32_window.cpp'>win32_window.cpp</a></b></td>
					</tr>
					<tr>
						<td><b><a href='https://github.com/keylian15/flutterproject/blob/master/windows/runner/utils.h'>utils.h</a></b></td>
					</tr>
					<tr>
						<td><b><a href='https://github.com/keylian15/flutterproject/blob/master/windows/runner/resource.h'>resource.h</a></b></td>
					</tr>
					<tr>
						<td><b><a href='https://github.com/keylian15/flutterproject/blob/master/windows/runner/Runner.rc'>Runner.rc</a></b></td>
					</tr>
					<tr>
						<td><b><a href='https://github.com/keylian15/flutterproject/blob/master/windows/runner/CMakeLists.txt'>CMakeLists.txt</a></b></td>
					</tr>
					<tr>
						<td><b><a href='https://github.com/keylian15/flutterproject/blob/master/windows/runner/flutter_window.cpp'>flutter_window.cpp</a></b></td>
					</tr>
					<tr>
						<td><b><a href='https://github.com/keylian15/flutterproject/blob/master/windows/runner/win32_window.h'>win32_window.h</a></b></td>
					</tr>
					<tr>
						<td><b><a href='https://github.com/keylian15/flutterproject/blob/master/windows/runner/runner.exe.manifest'>runner.exe.manifest</a></b></td>
					</tr>
					<tr>
						<td><b><a href='https://github.com/keylian15/flutterproject/blob/master/windows/runner/main.cpp'>main.cpp</a></b></td>
					</tr>
					<tr>
						<td><b><a href='https://github.com/keylian15/flutterproject/blob/master/windows/runner/utils.cpp'>utils.cpp</a></b></td>
					</tr>
					</table>
				</blockquote>
			</details>
		</blockquote>
	</details>
	<details> <!-- test Submodule -->
		<summary><b>test</b></summary>
		<blockquote>
			<table>
			<tr>
				<td><b><a href='https://github.com/keylian15/flutterproject/blob/master/test/widget_test.dart'>widget_test.dart</a></b></td>
			</tr>
			</table>
		</blockquote>
	</details>
	<details> <!-- macos Submodule -->
		<summary><b>macos</b></summary>
		<blockquote>
			<details>
				<summary><b>Runner.xcworkspace</b></summary>
				<blockquote>
					<table>
					<tr>
						<td><b><a href='https://github.com/keylian15/flutterproject/blob/master/macos/Runner.xcworkspace/contents.xcworkspacedata'>contents.xcworkspacedata</a></b></td>
					</tr>
					</table>
					<details>
						<summary><b>xcshareddata</b></summary>
						<blockquote>
							<table>
							<tr>
								<td><b><a href='https://github.com/keylian15/flutterproject/blob/master/macos/Runner.xcworkspace/xcshareddata/IDEWorkspaceChecks.plist'>IDEWorkspaceChecks.plist</a></b></td>
							</tr>
							</table>
						</blockquote>
					</details>
				</blockquote>
			</details>
			<details>
				<summary><b>Runner.xcodeproj</b></summary>
				<blockquote>
					<table>
					<tr>
						<td><b><a href='https://github.com/keylian15/flutterproject/blob/master/macos/Runner.xcodeproj/project.pbxproj'>project.pbxproj</a></b></td>
					</tr>
					</table>
					<details>
						<summary><b>xcshareddata</b></summary>
						<blockquote>
							<details>
								<summary><b>xcschemes</b></summary>
								<blockquote>
									<table>
									<tr>
										<td><b><a href='https://github.com/keylian15/flutterproject/blob/master/macos/Runner.xcodeproj/xcshareddata/xcschemes/Runner.xcscheme'>Runner.xcscheme</a></b></td>
									</tr>
									</table>
								</blockquote>
							</details>
						</blockquote>
					</details>
					<details>
						<summary><b>project.xcworkspace</b></summary>
						<blockquote>
							<details>
								<summary><b>xcshareddata</b></summary>
								<blockquote>
									<table>
									<tr>
										<td><b><a href='https://github.com/keylian15/flutterproject/blob/master/macos/Runner.xcodeproj/project.xcworkspace/xcshareddata/IDEWorkspaceChecks.plist'>IDEWorkspaceChecks.plist</a></b></td>
									</tr>
									</table>
								</blockquote>
							</details>
						</blockquote>
					</details>
				</blockquote>
			</details>
			<details>
				<summary><b>Flutter</b></summary>
				<blockquote>
					<table>
					<tr>
						<td><b><a href='https://github.com/keylian15/flutterproject/blob/master/macos/Flutter/GeneratedPluginRegistrant.swift'>GeneratedPluginRegistrant.swift</a></b></td>
					</tr>
					<tr>
						<td><b><a href='https://github.com/keylian15/flutterproject/blob/master/macos/Flutter/Flutter-Debug.xcconfig'>Flutter-Debug.xcconfig</a></b></td>
					</tr>
					<tr>
						<td><b><a href='https://github.com/keylian15/flutterproject/blob/master/macos/Flutter/Flutter-Release.xcconfig'>Flutter-Release.xcconfig</a></b></td>
					</tr>
					</table>
				</blockquote>
			</details>
			<details>
				<summary><b>RunnerTests</b></summary>
				<blockquote>
					<table>
					<tr>
						<td><b><a href='https://github.com/keylian15/flutterproject/blob/master/macos/RunnerTests/RunnerTests.swift'>RunnerTests.swift</a></b></td>
					</tr>
					</table>
				</blockquote>
			</details>
			<details>
				<summary><b>Runner</b></summary>
				<blockquote>
					<table>
					<tr>
						<td><b><a href='https://github.com/keylian15/flutterproject/blob/master/macos/Runner/DebugProfile.entitlements'>DebugProfile.entitlements</a></b></td>
					</tr>
					<tr>
						<td><b><a href='https://github.com/keylian15/flutterproject/blob/master/macos/Runner/AppDelegate.swift'>AppDelegate.swift</a></b></td>
					</tr>
					<tr>
						<td><b><a href='https://github.com/keylian15/flutterproject/blob/master/macos/Runner/Info.plist'>Info.plist</a></b></td>
					</tr>
					<tr>
						<td><b><a href='https://github.com/keylian15/flutterproject/blob/master/macos/Runner/MainFlutterWindow.swift'>MainFlutterWindow.swift</a></b></td>
					</tr>
					<tr>
						<td><b><a href='https://github.com/keylian15/flutterproject/blob/master/macos/Runner/Release.entitlements'>Release.entitlements</a></b></td>
					</tr>
					</table>
					<details>
						<summary><b>Assets.xcassets</b></summary>
						<blockquote>
							<details>
								<summary><b>AppIcon.appiconset</b></summary>
								<blockquote>
									<table>
									<tr>
										<td><b><a href='https://github.com/keylian15/flutterproject/blob/master/macos/Runner/Assets.xcassets/AppIcon.appiconset/Contents.json'>Contents.json</a></b></td>
									</tr>
									</table>
								</blockquote>
							</details>
						</blockquote>
					</details>
					<details>
						<summary><b>Configs</b></summary>
						<blockquote>
							<table>
							<tr>
								<td><b><a href='https://github.com/keylian15/flutterproject/blob/master/macos/Runner/Configs/AppInfo.xcconfig'>AppInfo.xcconfig</a></b></td>
							</tr>
							<tr>
								<td><b><a href='https://github.com/keylian15/flutterproject/blob/master/macos/Runner/Configs/Debug.xcconfig'>Debug.xcconfig</a></b></td>
							</tr>
							<tr>
								<td><b><a href='https://github.com/keylian15/flutterproject/blob/master/macos/Runner/Configs/Release.xcconfig'>Release.xcconfig</a></b></td>
							</tr>
							<tr>
								<td><b><a href='https://github.com/keylian15/flutterproject/blob/master/macos/Runner/Configs/Warnings.xcconfig'>Warnings.xcconfig</a></b></td>
							</tr>
							</table>
						</blockquote>
					</details>
					<details>
						<summary><b>Base.lproj</b></summary>
						<blockquote>
							<table>
							<tr>
								<td><b><a href='https://github.com/keylian15/flutterproject/blob/master/macos/Runner/Base.lproj/MainMenu.xib'>MainMenu.xib</a></b></td>
							</tr>
							</table>
						</blockquote>
					</details>
				</blockquote>
			</details>
		</blockquote>
	</details>
	<details> <!-- web Submodule -->
		<summary><b>web</b></summary>
		<blockquote>
			<table>
			<tr>
				<td><b><a href='https://github.com/keylian15/flutterproject/blob/master/web/index.html'>index.html</a></b></td>
			</tr>
			<tr>
				<td><b><a href='https://github.com/keylian15/flutterproject/blob/master/web/manifest.json'>manifest.json</a></b></td>
			</tr>
			</table>
		</blockquote>
	</details>
	<details> <!-- linux Submodule -->
		<summary><b>linux</b></summary>
		<blockquote>
			<table>
			<tr>
				<td><b><a href='https://github.com/keylian15/flutterproject/blob/master/linux/CMakeLists.txt'>CMakeLists.txt</a></b></td>
			</tr>
			</table>
			<details>
				<summary><b>flutter</b></summary>
				<blockquote>
					<table>
					<tr>
						<td><b><a href='https://github.com/keylian15/flutterproject/blob/master/linux/flutter/CMakeLists.txt'>CMakeLists.txt</a></b></td>
					</tr>
					<tr>
						<td><b><a href='https://github.com/keylian15/flutterproject/blob/master/linux/flutter/generated_plugin_registrant.cc'>generated_plugin_registrant.cc</a></b></td>
					</tr>
					<tr>
						<td><b><a href='https://github.com/keylian15/flutterproject/blob/master/linux/flutter/generated_plugin_registrant.h'>generated_plugin_registrant.h</a></b></td>
					</tr>
					<tr>
						<td><b><a href='https://github.com/keylian15/flutterproject/blob/master/linux/flutter/generated_plugins.cmake'>generated_plugins.cmake</a></b></td>
					</tr>
					</table>
				</blockquote>
			</details>
			<details>
				<summary><b>runner</b></summary>
				<blockquote>
					<table>
					<tr>
						<td><b><a href='https://github.com/keylian15/flutterproject/blob/master/linux/runner/main.cc'>main.cc</a></b></td>
					</tr>
					<tr>
						<td><b><a href='https://github.com/keylian15/flutterproject/blob/master/linux/runner/my_application.cc'>my_application.cc</a></b></td>
					</tr>
					<tr>
						<td><b><a href='https://github.com/keylian15/flutterproject/blob/master/linux/runner/CMakeLists.txt'>CMakeLists.txt</a></b></td>
					</tr>
					<tr>
						<td><b><a href='https://github.com/keylian15/flutterproject/blob/master/linux/runner/my_application.h'>my_application.h</a></b></td>
					</tr>
					</table>
				</blockquote>
			</details>
		</blockquote>
	</details>
</details>

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
