import 'package:credit_card_input_form/constants/captions.dart';
import 'package:flutter/material.dart';
import 'package:credit_card_input_form/constants/constanst.dart';
import 'package:credit_card_input_form/provider/card_name_provider.dart';
import 'package:provider/provider.dart';

class CardName extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final defaultName =
        Provider.of<Captions>(context).getCaption('NAME_SURNAME')!.toUpperCase();
    final String name =
        Provider.of<CardNameProvider>(context).cardName.toUpperCase();

    return Text(name.isNotEmpty ? name : defaultName,
        style: name.isNotEmpty ? kNametextStyle : kDefaultNameTextStyle);
  }
}
