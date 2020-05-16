import 'package:flutter/material.dart';
import 'package:credit_card_input_form/constants/constanst.dart';
import 'package:credit_card_input_form/provider/card_number_provider.dart';
import 'package:provider/provider.dart';


class CardLogo extends StatelessWidget {
  final master = Image.asset(
    'images/mastercard.png',
    width: 50,
  );
  final visa = Image.asset(
    'images/visacard.png',
    width: 50,
  );
  final discover = Image.asset(
    'images/discover.png',
    width: 50,
  );

  final amex = Image.asset(
    'images/amex.png',
    width: 50,
  );

  final others = Container();

  final Map<CardCompany, Set<List<String>>> cardNumPatterns =
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

  CardCompany detectCardCompany(String cardNumber) {
    //Default card type is other
    CardCompany cardType = CardCompany.OTHER;

    if (cardNumber.isEmpty) {
      return cardType;
    }

    cardNumPatterns.forEach(
      (CardCompany type, Set<List<String>> patterns) {
        for (List<String> patternRange in patterns) {
          String ccPatternStr =
              cardNumber.replaceAll(RegExp(r'\s+\b|\b\s'), '');
          final int rangeLen = patternRange[0].length;
          if (rangeLen < cardNumber.length) {
            ccPatternStr = ccPatternStr.substring(0, rangeLen);
          }

          if (patternRange.length > 1) {
            final int ccPrefixAsInt = int.parse(ccPatternStr);
            final int startPatternPrefixAsInt = int.parse(patternRange[0]);
            final int endPatternPrefixAsInt = int.parse(patternRange[1]);
            if (ccPrefixAsInt >= startPatternPrefixAsInt &&
                ccPrefixAsInt <= endPatternPrefixAsInt) {
              cardType = type;
              break;
            }
          } else {
            if (ccPatternStr == patternRange[0]) {
              cardType = type;
              break;
            }
          }
        }
      },
    );

    return cardType;
  }

  @override
  Widget build(BuildContext context) {
    String cardNumber = Provider.of<CardNumberProvider>(context).cardNumber;

    CardCompany cardCompany = detectCardCompany(cardNumber);

    return Stack(
      children: <Widget>[
        AnimatedOpacity(
          opacity: cardCompany == CardCompany.VISA ? 1 : 0,
          child: visa,
          duration: Duration(milliseconds: 200),
        ),
        AnimatedOpacity(
            opacity: cardCompany == CardCompany.MASTER ? 1 : 0,
            child: master,
            duration: Duration(milliseconds: 200)),
        AnimatedOpacity(
            opacity: cardCompany == CardCompany.DISCOVER ? 1 : 0,
            child: discover,
            duration: Duration(milliseconds: 200)),
        AnimatedOpacity(
            opacity: cardCompany == CardCompany.AMERICAN_EXPRESS ? 1 : 0,
            child: amex,
            duration: Duration(milliseconds: 200)),
      ],
    );
  }
}
