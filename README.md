# minotaur

A music player app that. All content data from itunes API. So, basically the music that you listen from the app is only in preview mode from itunes. This project builded with Flutter version 3.7.1, Dart version 2.19.1, Android SDK 33.0.2, Xcode 14.0 & Java version 11.0.12

## Getting Started

### Installation

- Make sure you already installed Flutter.
- I recommended use all tools version that i mentioned in description

```
   git clone github.com/nandanurseptama/minotaurr.git <folder_name>
   cd <folder_name>
```

### Run

- env_name was variable that you can pass on cli. You can pass DEV or PROD as value

```
   flutter pub get
   flutter run --multidex --dart-define=env_name=DEV
```

### Build

```
    flutter build apk --multidex --dart-define=env_name=PROD
```

## Miscellaneous

### Dependencies
- shared_preferences (local storage)
- dio (http client)
- flutter_bloc (state management)
- freezed_annotation (annotation for data-classes/unions/pattern-matching/cloning)
- json_annotation (annotation for model to generate fromJson & toJson)
- equatable (Equality comparator)
- just_audio (Media Player)
- injectable (Injectable generates code that we would have otherwise written by using annotations)
- get_it (service locator)
- uuid (uuid generator)
- cached_network_image (library to render and cached image from url)

### Dev Dependencies
- build_runner (A build system for Dart code generation and modular compilation)
- injectable_generator (injectable code generator)
- freezed (code generator for data-classes/unions/pattern-matching/cloning)
- json_serializable (code generator for model)

## Screen Shoot
<img src="https://raw.githubusercontent.com/nandanurseptama/minotaurr/master/ss/home_light.png" width="270" height="570" alt="Home Light Screen">
![Alt text](https://raw.githubusercontent.com/nandanurseptama/minotaurr/master/ss/player_light.png "Player Light Screen")
![Alt text](https://raw.githubusercontent.com/nandanurseptama/minotaurr/master/ss/player_playlist_light.png "Player Light Screen with Bottom Sheet Playlist Shown")
![Alt text](https://raw.githubusercontent.com/nandanurseptama/minotaurr/master/ss/home_dark.png "Home Dark Screen")
![Alt text](https://raw.githubusercontent.com/nandanurseptama/minotaurr/master/ss/player_dark.png "Player Dark Screen")
![Alt text](https://raw.githubusercontent.com/nandanurseptama/minotaurr/master/ss/player_playlist_dark.png "Player Dark Screen with Bottom Sheet Playlist Shown")
