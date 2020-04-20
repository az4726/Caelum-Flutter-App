# Caelum – A weather app

> caelum - sky, heaven, air, weather, climate

[![GPLv3 License](https://img.shields.io/github/license/az4726/Caelum-Flutter-App)](https://opensource.org/licenses/)	[![GitHub issues](https://img.shields.io/github/issues/az4726/Caelum-Flutter-App)](https://github.com/az4726/Caelum-Flutter-App/issues)	[![PR's Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat)](http://makeapullrequest.com)

## General info
Caelum was programmed in Dart using the Flutter SDK. It uses the OpenWeatherMap API to collect weather information to then display to the user. The design was inspired by [Ruben Vaalt's concept on Dribbble](https://dribbble.com/shots/5798457--Weather-App).

![Banner](/Banner.png)
 
## Technologies
This Project has been  created with:

* [Flutter SDK](https://flutter.dev/)
* [OpenWeatherMap API](https://openweathermap.org/forecast5)
* [Android Studio](https://developer.android.com/studio)
 
## Installation
To view the source code and build APKs to test, you will need to ensure that Android Studio (or Visual Studio Code) is installed and set up to work with the Flutter SDK. You can find clear instructions on the Flutter SDK website.

You will also need a virtual device set up or a physical Android device plugged into your computer.

### API Reference

After the project has been set up and before you can begin to test the app, you will need to modify the weather.dart file and add your OpenWeatherMap API key. This can be generated after you have created an account on the [website](https://openweathermap.org/).

Once the API key has been added, the app should function correctly on your device.

### Packages being used

Various Dart packages have been used and are listed below. All have been found on [pub.dev](https://pub.dev/)

* [http](https://pub.dev/packages/http) - Used to send network requests
* [geolocator](https://pub.dev/packages/geolocator) - Used to get device location
* [date_format](https://pub.dev/packages/date_format) - Used to format date to match concept image format
* [outline\_material\_icons](https://pub.dev/packages/outline_material_icons) - Used to change material icon theme to outline
* [flutter_spinkit](https://pub.dev/packages/flutter_spinkit) - Used to display loading indicator when required
* [font\_awesome\_flutter](https://pub.dev/packages/font_awesome_flutter) - Used to display FontAwesome weather icons
* [flutter\_launcher\_icons](https://pub.dev/packages/flutter_launcher_icons) - Used to implement adaptive icon
	
### Setup

#### Initial Setup

If project is opened for the first time, type the following lines in the terminal:

```
flutter clean
flutter pub get
```

#### Create and run debug app

To create and run a debug version of the app, type the following line in the terminal:

```
flutter clean
```
and then click the Run button found at the top.

#### Create and run release app

To create and run a release version of the app, type the following lines in the terminal:

```
flutter clean
flutter run --release
```
For a wider deployment and release, you will need to follow the instructions providied in the [Flutter documentation](https://flutter.dev/docs/deployment/android).

## To-do

* Add more weather information for each day (Hourly weather, precipitation, humidity)
* Add the ability to save locations for future reference
* Add the ability to share weather information

The issues tab may also contain tasks that need completing.

## License

As the GPL licence states, feel free to modify and distribute this project in any way.

GPL-3 © [Azhar Zaman](https://github.com/az4726)

