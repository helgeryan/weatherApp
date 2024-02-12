# Weather Application

This is a demo application to pull the hourly/daily weather forecasts for cities. The app consists of a single page with a text field to enter in the location the user would like to get a forecast. The current weather and hourly/daily forecasts will then be displayed to the user. If the search query returns bad results, an `ErrorView` will be displayed to the user. in addition to an error view, there is a `LoadingView` to show the use the app is in a state of loading.

## Xcode Version

Due to machine requirements for other projects the app was built on the 15.3 Beta (15E5178i) version of Xcode. 

## Miimum Deployment Target

Minimum deployment target for the project is set to 17.0

## Project Structure

This section will lay out the general structure of the apps project navigator

### App

UI modules that act as an entry point.

### API

Holds all network calls and API related actions. 

- Common: Network/API modules common to all API actions
- WeatherApiService: Actions to pull data from https://www.weatherapi.com/docs/

### Models

All models used in the project that are mapped down from APIs.

### Resources

- Extensions: Additional functionality to native Swift variables
- Constants: Constants values used across the app

### UI

All user interface files used across the app.

- Common: UI elements that are common throughout all facets of the app.
- Home: UI elements that are contained within the Home scene



