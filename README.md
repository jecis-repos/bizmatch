# Business Match

Flutter prototype for browsing business and employee profile cards. The Facebook, Google and LinkedIn buttons navigate to demo screens; they do not perform OAuth sign-in.

## Run locally

Use Flutter with Dart 3.6 or newer (tested with Flutter 3.41.5 / Dart 3.11.3).

```sh
flutter pub get
flutter run -d chrome
```

## Validate

```sh
flutter analyze
flutter test
flutter build web
```

The web target and navigation test are the maintained validation path. Android and iOS builds also require their platform SDKs and signing configuration.
