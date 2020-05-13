![스크린샷 2020-03-13 오후 1 48 51](https://user-images.githubusercontent.com/35194820/76590756-8c4ed180-6531-11ea-89f5-382a9553541e.png)

<div align="center">
	<a href="https://flutter.io">
    <img src="https://img.shields.io/badge/Platform-Flutter-yellow.svg"
      alt="Platform" />
  </a>
<a href="https://github.com/Solido/awesome-flutter">
   <img alt="Awesome Flutter" src="https://img.shields.io/badge/Awesome-Flutter-blue.svg?longCache=true&style=flat-square" />
</a>
</div><br>

## Reference

<div align="center">

![sample](https://user-images.githubusercontent.com/35194820/75879920-a157a080-5e5f-11ea-9763-823ad8f1a4e5.gif)

https://dribbble.com/shots/6440077-Add-a-New-Credit-Card-alternate-flow

</div><br>

## Real output (실제 결과물)

<div align="center">

<img src="https://user-images.githubusercontent.com/35194820/76142013-d0168680-60ac-11ea-9007-0db57373f96f.gif" width="250" >

</div>

## Source Tree

```
lib
├─ components
│  ├─ back_card_view.dart
│  ├─ card_cvv.dart
│  ├─ card_logo.dart
│  ├─ card_name.dart
│  ├─ card_number.dart
│  ├─ card_sign.dart
│  ├─ card_valid.dart
│  ├─ front_card_view.dart
│  ├─ input_view_pager.dart
│  ├─ my_appbar.dart
│  ├─ round_button.dart
│  └─ yellow_border.dart
├─ constanst.dart
├─ main.dart
├─ provider
│  ├─ card_cvv_provider.dart
│  ├─ card_name_provider.dart
│  ├─ card_number_provider.dart
│  ├─ card_valid_provider.dart
│  └─ state_provider.dart
├─ screens
│  └─ MainScreen.dart
└─ util
   └─ util.dart

```

## 3rd party library

### Flip card 

https://pub.dev/packages/flip_card

For use card flip animation

### Provider

https://pub.dev/packages/provider

For use state management

## ToDo

- [x] When entering card number or expiration date in TextField, additional delimiter ("", /) is displayed.
- [x] Support the more card company logo(Visa, Master, Amex, Discover)
- [ ] Add `Prev` button
- [ ] Release Dart package
