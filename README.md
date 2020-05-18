
<div align="center">

<img src="https://user-images.githubusercontent.com/35194820/76590756-8c4ed180-6531-11ea-89f5-382a9553541e.png" width="600" >

</div>

<div align="center">
	<a href="https://flutter.io">
    <img src="https://img.shields.io/badge/Platform-Flutter-yellow.svg"
      alt="Platform" />
  </a>
<a href="https://github.com/Solido/awesome-flutter">
   <img alt="Awesome Flutter" src="https://img.shields.io/badge/Awesome-Flutter-blue.svg?longCache=true&style=flat-square" />
</a>
</div><br>

This package provides visually beautiful UX through animation of credit card information input form.

## Preview

<div align="center">

<img src="https://user-images.githubusercontent.com/35194820/76142013-d0168680-60ac-11ea-9007-0db57373f96f.gif" width="250" >

</div>

## Installing

1. Add dependency to `pubspec.yaml`

    *Get the latest version in the 'Installing' tab on pub.dartlang.org*
    
```dart
dependencies:
    credit_card_input_form: 1.0.0
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
   frondCardColor: Colors.red,
   backCardColor: Colors.blueAccent,
   onStateChange: (currentState, cardInfo) {
   print(currentState);
   print(cardInfo);
   },
),
```

## How to use

Check out the **example** app in the [example](example) directory or the 'Example' tab on pub.dartlang.org for a more complete example.

## 3rd party library

### Flip card

https://pub.dev/packages/flip_card

*For use card flip animation*

### Provider

https://pub.dev/packages/provider

*For use state management*

## Reference

This package's animation is inspired from from this [Dribbble](https://dribbble.com/shots/6440077-Add-a-New-Credit-Card-alternate-flow
) art.
