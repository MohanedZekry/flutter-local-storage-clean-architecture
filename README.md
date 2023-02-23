# Flutter Local Storage Clean Architecture

<i> In this project we will use trending local storage packages We’ll do some benchmarking to determine how long it takes each option to perform operations, so we can have a clear understanding of which is the best choice for us. 
The project is implementing  a clean architecture so that it’s easy to understand and easy to change as the project grows in the future and implement new technologies or packages.
</i>
- [hive](https://pub.dev/packages/hive)
- [sembast](https://pub.dev/packages/sembast)
- [sqflite](https://pub.dev/packages/sqflite)
- [shared_preferences](https://pub.dev/packages/shared_preferences)
- [isar](https://pub.dev/packages/isar)

## Table of Contents
- [Modules](#modules)
- [Implementation](#implementation)
  - [Hive](#hive)

## Modules
| Modules       | Progress   |
| :----------   | :-------:  |
| Data          |    ☑️     | 
| Domain        |    ✅     |
| Presentation  |            |

## Implementation
##### Hive
Hive is a quick, lightweight, NoSQL database for flutter and dart applications. Hive is truly helpful if you need a straightforward key-value database without numerous relations.
Hive having the idea of `boxes` (which store data). A Box must be opened before use. Notwithstanding the plain-enhanced Boxes, there are additional alternatives that help lazy-loading of values and encryption.
Hive stores its data in boxes containing key-value sets `Hive.box`
You can call 
```dart
Hive.openBox(‘name’) 
```
regardless of whether you as of now have the box opened elsewhere.

