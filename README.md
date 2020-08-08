
<div align="center">

<img src="https://user-images.githubusercontent.com/35194820/76590756-8c4ed180-6531-11ea-89f5-382a9553541e.png" width="600" >

</div>

<div align="center">
	<a href="https://flutter.io">
    <img src="https://img.shields.io/badge/Platform-Flutter-yellow.svg"
      alt="Platform" />
  </a>
  <a href="https://pub.dev/packages/credit_card_input_form">
   <img src="https://img.shields.io/badge/pub-v1.3.0-blue" />

</a>
<a href="https://github.com/Solido/awesome-flutter">
   <img alt="Awesome Flutter" src="https://img.shields.io/badge/Awesome-Flutter-blue.svg?longCache=true&style=flat-square" />

</a>
   <img src="https://img.shields.io/github/forks/Origogi/Flutter-Credit-Card-Input-Form" >
<img src="https://img.shields.io/github/stars/Origogi/Flutter-Credit-Card-Input-Form" >
<img src="https://img.shields.io/github/license/Origogi/Flutter-Credit-Card-Input-Form" >

</div><br>

This package provides visually beautiful UX through animation of credit card information input form.

## Preview

<div align="center">

<img src="https://user-images.githubusercontent.com/35194820/82177030-5bb15c80-9913-11ea-83bf-d6bfdf858f04.gif" width="250" >

</div>

## Installing

1. Add dependency to `pubspec.yaml`

    *Get the latest version in the 'Installing' tab on pub.dartlang.org*
    
```dart
dependencies:
    credit_card_input_form: ^1.3.0
```

2. Import the package

```dart
import 'package:credit_card_input_form/credit_card_input_form.dart';
```

3. Adding `CreditCardInputForm`

*With optional parameters*
```dart
 CreditCardInputForm(
   cardHeight: 170,
   frontCardColor: Colors.red,
   backCardColor: Colors.blueAccent,
   showResetButton : true,
   onStateChange: (currentState, cardInfo) {
     print(currentState);
     print(cardInfo);
   },
   customCaptions: {...},  // translate and customize captions (see Example)
),
```

## How to use

Check out the **example** app in the [example](example) directory or the 'Example' tab on pub.dartlang.org for a more complete example.

## New Feature

### v1.3.0

added custom button style feature

<div align="center">

|Default|Custom|
|------|---|
|![default](https://user-images.githubusercontent.com/35194820/89704240-1e49f180-d98d-11ea-9305-5938f0386251.PNG)|![custom](https://user-images.githubusercontent.com/35194820/89704237-1d18c480-d98d-11ea-9557-36a8519da301.PNG)|
</div>

~~~dart
final buttonStyle = BoxDecoration(
    borderRadius: BorderRadius.circular(30.0),
    gradient: LinearGradient(
        colors: [
          const Color(0xfffcdf8a),
          const Color(0xfff38381),
        ],
        begin: const FractionalOffset(0.0, 0.0),
        end: const FractionalOffset(1.0, 0.0),
        stops: [0.0, 1.0],
        tileMode: TileMode.clamp),
  );

  final buttonTextStyle =
      TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18);

  CreditCardInputForm(
    showResetButton: true,
    onStateChange: (currentState, cardInfo) {
      print(currentState);
      print(cardInfo);
    },
    customCaptions: customCaptions,
    prevButtonStyle: buttonStyle,
    nextButtonStyle: buttonStyle,
    prevButtonTextStyle: buttonTextStyle,
    nextButtonTextStyle: buttonTextStyle,
    resetButtonTextStyle: buttonTextStyle,
  ),

~~~


## 3rd party library

### Flip card

https://pub.dev/packages/flip_card

*For use card flip animation*

### Provider

https://pub.dev/packages/provider

*For use state management*

## Reference

This package's animation is inspired from from this [Dribbble](https://dribbble.com/shots/6440077-Add-a-New-Credit-Card-alternate-flow
) art

## TODO List

- [x] add `RESET` button
