import 'package:flutter/material.dart';

const kCardNumberTextStyle = TextStyle(
    color: Colors.white,
    fontFamily: 'U and I',
    fontWeight: FontWeight.bold,
    fontSize: 24);

const kCardDefaultTextStyle =
    TextStyle(color: Colors.grey, fontFamily: 'U and I', fontSize: 25);

const kCVCTextStyle = TextStyle(
    color: Colors.black,
    fontFamily: 'Satisfy',
    fontWeight: FontWeight.bold,
    fontSize: 20);

const kTextStyle = TextStyle(
  fontSize: 8,
  fontWeight: FontWeight.bold,
  color: Colors.white,
  fontFamily: 'U and I',
);

const kNametextStyle = TextStyle(
  fontSize: 15,
  color: Colors.white,
  fontFamily: 'U and I',
);

const kDefaultNameTextStyle = TextStyle(
  fontSize: 15,
  color: Colors.grey,
  fontFamily: 'U and I',
);

const kValidtextStyle = TextStyle(
  fontSize: 15,
  color: Colors.white,
  fontFamily: 'U and I',
);

const kDefaultValidTextStyle = TextStyle(
  fontSize: 15,
  color: Colors.grey,
  fontFamily: 'U and I',
);

const kSignTextStyle = TextStyle(
  fontSize: 20,
  color: Colors.white,
  fontFamily: 'Satisfy',
);

enum InputState { number, name, validate, CVV }

enum CardCompany { VISA, MASTER, AMERICAN_EXPRESS, DISCOVER, OTHER }

Map<CardCompany, Set<List<String>>> cardNumPatterns =
    <CardCompany, Set<List<String>>>{
  CardCompany.VISA: <List<String>>{
    <String>['4'],
  },
  CardCompany.AMERICAN_EXPRESS: <List<String>>{
    <String>['34'],
    <String>['37'],
  },
  CardCompany.DISCOVER: <List<String>>{
    <String>['6011'],
    <String>['622126', '622925'],
    <String>['644', '649'],
    <String>['65']
  },
  CardCompany.MASTER: <List<String>>{
    <String>['51', '55'],
    <String>['2221', '2229'],
    <String>['223', '229'],
    <String>['23', '26'],
    <String>['270', '271'],
    <String>['2720'],
  },
};
