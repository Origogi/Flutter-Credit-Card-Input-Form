import 'package:credit_card_input_form/constants/captions.dart';
import 'package:credit_card_input_form/util/util.dart';
import 'package:flutter/material.dart';
import 'package:credit_card_input_form/constants/constanst.dart';
import 'package:credit_card_input_form/provider/card_cvv_provider.dart';
import 'package:credit_card_input_form/provider/card_name_provider.dart';
import 'package:credit_card_input_form/provider/card_valid_provider.dart';
import 'package:credit_card_input_form/provider/state_provider.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:credit_card_input_form/provider/card_number_provider.dart';

class InputViewPager extends StatefulWidget {
  final pageController;
  final isAutoFoucus;

  InputViewPager({this.pageController, this.isAutoFoucus});

  @override
  _InputViewPagerState createState() => _InputViewPagerState();
}

class _InputViewPagerState extends State<InputViewPager> {
  final List<FocusNode> focusNodes = [
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final captions = Provider.of<Captions>(context);

    final titleMap = {
      0: captions.getCaption('CARD_NUMBER'),
      1: captions.getCaption('CARDHOLDER_NAME'),
      2: captions.getCaption('VALID_THRU'),
      3: captions.getCaption('SECURITY_CODE_CVC'),
    };

    Provider.of<StateProvider>(context).addListener(() {
      int index = Provider.of<StateProvider>(context, listen: false)
          .getCurrentState()!
          .index;

      if (index < focusNodes.length) {
        FocusScope.of(context).requestFocus(focusNodes[index]);
      } else {
        FocusScope.of(context).unfocus();
        SystemChannels.textInput.invokeMethod('TextInput.hide');
      }
    });

    return Container(
        height: 90,
        child: PageView.builder(
            physics: NeverScrollableScrollPhysics(),
            controller: widget.pageController,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: InputForm(
                    isAutoFocus: widget.isAutoFoucus,
                    focusNode: focusNodes[index],
                    title: titleMap[index],
                    index: index,
                    pageController: widget.pageController),
              );
            },
            itemCount: titleMap.length));
  }
}

class InputForm extends StatefulWidget {
  final String? title;
  final int? index;
  final PageController? pageController;
  final FocusNode? focusNode;
  final isAutoFocus;

  InputForm(
      {required this.title,
      this.index,
      this.pageController,
      this.focusNode,
      this.isAutoFocus});

  @override
  _InputFormState createState() => _InputFormState();
}

class _InputFormState extends State<InputForm> {
  var opacicy = 0.3;

  int? maxLength;
  TextInputType? textInputType;
  TextEditingController textController = TextEditingController();

  void onChange() {
    setState(() {
      if (widget.index == widget.pageController!.page!.round()) {
        opacicy = 1;
      } else {
        opacicy = 0.3;
      }
    });
  }

  String? value;

  @override
  void initState() {
    super.initState();

    int index = Provider.of<StateProvider>(context, listen: false)
        .getCurrentState()!
        .index;

    if (widget.index == index) {
      opacicy = 1;
    }

    widget.pageController!.addListener(onChange);

    if (widget.index == InputState.NUMBER.index) {
      maxLength = 19;
      textInputType = TextInputType.number;
    } else if (widget.index == InputState.NAME.index) {
      maxLength = 20;
      textInputType = TextInputType.text;
    } else if (widget.index == InputState.VALIDATE.index) {
      maxLength = 5;
      textInputType = TextInputType.number;
    } else if (widget.index == InputState.CVV.index) {
      String cardNumber =
          Provider.of<CardNumberProvider>(context, listen: false).cardNumber;

      if (CardCompany.AMERICAN_EXPRESS == detectCardCompany(cardNumber)) {
        maxLength = 4;
      } else {
        maxLength = 3;
      }
      textInputType = TextInputType.number;
    }
  }

  @override
  void dispose() {
    widget.pageController!.removeListener(onChange);

    super.dispose();
  }

  var isInit = false;

  @override
  Widget build(BuildContext context) {
    String? textValue = "";

    if (widget.index == InputState.NUMBER.index) {
      textValue =
          Provider.of<CardNumberProvider>(context, listen: false).cardNumber;
    } else if (widget.index == InputState.NAME.index) {
      textValue =
          Provider.of<CardNameProvider>(context, listen: false).cardName;
    } else if (widget.index == InputState.VALIDATE.index) {
      textValue =
          Provider.of<CardValidProvider>(context, listen: false).cardValid;
    } else if (widget.index == InputState.CVV.index) {
      textValue = Provider.of<CardCVVProvider>(context).cardCVV;
    }

    int index = Provider.of<StateProvider>(context, listen: false)
        .getCurrentState()!
        .index;

    return Opacity(
      opacity: opacicy,
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              widget.title!,
              style: TextStyle(fontSize: 12, color: Colors.black38),
            ),
            SizedBox(
              height: 5,
            ),
            TextField(
              autocorrect: false,
              autofocus: widget.isAutoFocus && widget.index == index,
              controller: textController
                ..value = textController.value.copyWith(
                  text: textValue,
                  selection: TextSelection.fromPosition(
                    TextPosition(offset: textValue!.length),
                  ),
                ),
              focusNode: widget.focusNode,
              keyboardType: textInputType,
              maxLength: maxLength,
              onChanged: (String newValue) {
                if (widget.index == InputState.NUMBER.index) {
                  Provider.of<CardNumberProvider>(context, listen: false)
                      .setNumber(newValue);
                } else if (widget.index == InputState.NAME.index) {
                  Provider.of<CardNameProvider>(context, listen: false)
                      .setName(newValue);
                } else if (widget.index == InputState.VALIDATE.index) {
                  Provider.of<CardValidProvider>(context, listen: false)
                      .setValid(newValue);
                } else if (widget.index == InputState.CVV.index) {
                  Provider.of<CardCVVProvider>(context, listen: false)
                      .setCVV(newValue);
                }
              },
              decoration: InputDecoration(
                isDense: true,
                counter: SizedBox(
                  height: 0,
                ),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
                border: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.black38),
                    borderRadius: BorderRadius.circular(5)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.black38),
                    borderRadius: BorderRadius.circular(5)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
