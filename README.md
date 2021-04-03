
<div align="center">

<img src="https://user-images.githubusercontent.com/35194820/76590756-8c4ed180-6531-11ea-89f5-382a9553541e.png" width="600" >

</div>

<div align="center">
	<a href="https://flutter.io">
    <img src="https://img.shields.io/badge/Platform-Flutter-yellow.svg"
      alt="Platform" />
  </a>
  <a href="https://pub.dev/packages/credit_card_input_form">
   <img src="https://img.shields.io/badge/pub-v2.3.0-red" />

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
    credit_card_input_form: ^2.3.0
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
   showResetButton : true,
   onStateChange: (currentState, cardInfo) {
     print(currentState);
     print(cardInfo);
   },
   customCaptions: {...}, 
   frontCardDecoration: cardDecoration,
   backCardDecoration: cardDecoration,
   prevButtonDecoration: buttonStyle,
   nextButtonDecoration: buttonStyle,
   resetButtonDecoration : buttonStyle,
   prevButtonTextStyle: buttonTextStyle,
   nextButtonTextStyle: buttonTextStyle,
   resetButtonTextStyle: buttonTextStyle,
   initialAutoFocus: true, // optional

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
final buttonDecoration = BoxDecoration(
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
    prevButtonDecoration: buttonDecoration,
    nextButtonDecoration: buttonDecoration,
    prevButtonTextStyle: buttonTextStyle,
    nextButtonTextStyle: buttonTextStyle,
    resetButtonTextStyle: buttonTextStyle,
  ),

~~~

### v2.0.0

It provides more options using boxdecoration that can only change the color of the card.

<div align="center">

|Default|Custom|
|------|---|
|![image](https://user-images.githubusercontent.com/35194820/89976756-434ba680-dca4-11ea-8297-ed7dccbfb6e6.png)|![image](https://user-images.githubusercontent.com/35194820/89976725-2b742280-dca4-11ea-8771-9e3bd9690ee0.png)|
</div>

~~~dart
  final cardDecoration = BoxDecoration(
    boxShadow: <BoxShadow>[
      BoxShadow(color: Colors.black54, blurRadius: 15.0, offset: Offset(0, 8))
    ],
    gradient: LinearGradient(
        colors: [
          Colors.red,
          Colors.blue,
        ],
        begin: const FractionalOffset(0.0, 0.0),
        end: const FractionalOffset(1.0, 0.0),
        stops: [0.0, 1.0],
        tileMode: TileMode.clamp),
    borderRadius: BorderRadius.all(Radius.circular(15)));


    CreditCardInputForm(
      frontCardDecoration: cardDecoration,
      backCardDecoration: cardDecoration,
    ),
  ]),
~~~

### v2.1.0

implement a new feature to add an initial value when creating a widget

<table>
<tr>
<td> Code </td> <td> Preview </td>
</tr>
<tr>
<td> 

~~~dart
CreditCardInputForm(
  ....
  cardCVV: '222',
  cardName: 'Jeongtae Kim',
  cardNumber: '1111111111111111',
  cardValid: '12/12',
  intialCardState: InputState.DONE,
),
~~~
</td>
<td>

![ezgif com-gif-maker](https://user-images.githubusercontent.com/35194820/96005684-a958d380-0e77-11eb-8b5e-f9dd889c875f.gif)


</td>
</tr>
</table>

### v2.2.0

Add `initialAutoFocus` parameter

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
- [x] add box decoration param
