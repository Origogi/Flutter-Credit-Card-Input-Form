import 'package:credit_card_input_form/components/reset_button.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:credit_card_input_form/components/back_card_view.dart';
import 'package:credit_card_input_form/components/front_card_view.dart';
import 'package:credit_card_input_form/components/input_view_pager.dart';
import 'package:credit_card_input_form/components/round_button.dart';
import 'package:credit_card_input_form/constants/constanst.dart';
import 'package:credit_card_input_form/model/card_info.dart';
import 'package:credit_card_input_form/provider/card_cvv_provider.dart';
import 'package:credit_card_input_form/provider/card_name_provider.dart';
import 'package:credit_card_input_form/provider/card_number_provider.dart';
import 'package:credit_card_input_form/provider/card_valid_provider.dart';
import 'package:credit_card_input_form/provider/state_provider.dart';
import 'package:provider/provider.dart';

import 'constants/captions.dart';
import 'constants/constanst.dart';

typedef CardInfoCallback = void Function(
    InputState currentState, CardInfo cardInfo);

class CreditCardInputForm extends StatelessWidget {
  CreditCardInputForm(
      {this.onStateChange,
      this.cardHeight,
      this.frontCardDecoration,
      this.backCardDecoration,
      this.showResetButton = true,
      this.customCaptions,
      this.cardNumber = '',
      this.cardName = '',
      this.cardCVV = '',
      this.cardValid = '',
      this.initialAutoFocus = true,
      this.intialCardState = InputState.NUMBER,
      this.nextButtonTextStyle = kDefaultButtonTextStyle,
      this.prevButtonTextStyle = kDefaultButtonTextStyle,
      this.resetButtonTextStyle = kDefaultButtonTextStyle,
      this.nextButtonDecoration = defaultNextPrevButtonDecoration,
      this.prevButtonDecoration = defaultNextPrevButtonDecoration,
      this.resetButtonDecoration = defaultResetButtonDecoration});

  final Function? onStateChange;
  final double? cardHeight;
  final BoxDecoration? frontCardDecoration;
  final BoxDecoration? backCardDecoration;
  final bool showResetButton;
  final Map<String, String>? customCaptions;
  final BoxDecoration nextButtonDecoration;
  final BoxDecoration prevButtonDecoration;
  final BoxDecoration resetButtonDecoration;
  final TextStyle nextButtonTextStyle;
  final TextStyle prevButtonTextStyle;
  final TextStyle resetButtonTextStyle;
  final String cardNumber;
  final String cardName;
  final String cardCVV;
  final String cardValid;
  final initialAutoFocus;
  final InputState intialCardState;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => StateProvider(intialCardState),
        ),
        ChangeNotifierProvider(
          create: (context) => CardNumberProvider(cardNumber),
        ),
        ChangeNotifierProvider(
          create: (context) => CardNameProvider(cardName),
        ),
        ChangeNotifierProvider(
          create: (context) => CardValidProvider(cardValid),
        ),
        ChangeNotifierProvider(
          create: (context) => CardCVVProvider(cardCVV),
        ),
        Provider(
          create: (_) => Captions(customCaptions: customCaptions),
        ),
      ],
      child: CreditCardInputImpl(
        onCardModelChanged:
            onStateChange as void Function(InputState, CardInfo)?,
        backDecoration: backCardDecoration,
        frontDecoration: frontCardDecoration,
        cardHeight: cardHeight,
        initialAutoFocus: initialAutoFocus,
        showResetButton: showResetButton,
        prevButtonDecoration: prevButtonDecoration,
        nextButtonDecoration: nextButtonDecoration,
        resetButtonDecoration: resetButtonDecoration,
        prevButtonTextStyle: prevButtonTextStyle,
        nextButtonTextStyle: nextButtonTextStyle,
        resetButtonTextStyle: resetButtonTextStyle,
        initialCardState: intialCardState,
      ),
    );
  }
}

class CreditCardInputImpl extends StatefulWidget {
  final CardInfoCallback? onCardModelChanged;
  final double? cardHeight;
  final BoxDecoration? frontDecoration;
  final BoxDecoration? backDecoration;
  final bool? showResetButton;
  final BoxDecoration? nextButtonDecoration;
  final BoxDecoration? prevButtonDecoration;
  final BoxDecoration? resetButtonDecoration;
  final TextStyle? nextButtonTextStyle;
  final TextStyle? prevButtonTextStyle;
  final TextStyle? resetButtonTextStyle;
  final InputState? initialCardState;
  final initialAutoFocus;

  CreditCardInputImpl(
      {this.onCardModelChanged,
      this.cardHeight,
      this.showResetButton,
      this.frontDecoration,
      this.backDecoration,
      this.nextButtonTextStyle,
      this.prevButtonTextStyle,
      this.resetButtonTextStyle,
      this.nextButtonDecoration,
      this.prevButtonDecoration,
      this.initialCardState,
      this.initialAutoFocus,
      this.resetButtonDecoration});

  @override
  _CreditCardInputImplState createState() => _CreditCardInputImplState();
}

class _CreditCardInputImplState extends State<CreditCardInputImpl> {
  PageController? pageController;

  final GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();

  final cardHorizontalpadding = 12;
  final cardRatio = 16.0 / 9.0;

  var _currentState;

  @override
  void initState() {
    super.initState();

    _currentState = widget.initialCardState;

    pageController = PageController(
      viewportFraction: 0.92,
      initialPage: widget.initialCardState!.index,
    );
  }

  @override
  Widget build(BuildContext context) {
    final newState = Provider.of<StateProvider>(context).getCurrentState();

    final name = Provider.of<CardNameProvider>(context).cardName;

    final cardNumber = Provider.of<CardNumberProvider>(context).cardNumber;

    final valid = Provider.of<CardValidProvider>(context).cardValid;

    final cvv = Provider.of<CardCVVProvider>(context).cardCVV;

    final captions = Provider.of<Captions>(context);

    if (newState != _currentState) {
      _currentState = newState;

      Future(() {
        widget.onCardModelChanged!(
            _currentState,
            CardInfo(
                name: name, cardNumber: cardNumber, validate: valid, cvv: cvv));
      });
    }

    double cardWidth =
        MediaQuery.of(context).size.width - (2 * cardHorizontalpadding);

    double? cardHeight;
    if (widget.cardHeight != null && widget.cardHeight! > 0) {
      cardHeight = widget.cardHeight;
    } else {
      cardHeight = cardWidth / cardRatio;
    }

    final frontDecoration = widget.frontDecoration != null
        ? widget.frontDecoration
        : defaultCardDecoration;
    final backDecoration = widget.backDecoration != null
        ? widget.backDecoration
        : defaultCardDecoration;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: FlipCard(
            speed: 300,
            flipOnTouch: _currentState == InputState.DONE,
            key: cardKey,
            front:
                FrontCardView(height: cardHeight, decoration: frontDecoration),
            back: BackCardView(height: cardHeight, decoration: backDecoration),
          ),
        ),
        Stack(
          children: [
            AnimatedOpacity(
              opacity: _currentState == InputState.DONE ? 0 : 1,
              duration: Duration(milliseconds: 500),
              child: InputViewPager(
                isAutoFoucus: widget.initialAutoFocus,
                pageController: pageController,
              ),
            ),
            Align(
                alignment: Alignment.center,
                child: AnimatedOpacity(
                    opacity: widget.showResetButton! &&
                            _currentState == InputState.DONE
                        ? 1
                        : 0,
                    duration: Duration(milliseconds: 500),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ResetButton(
                        decoration: widget.resetButtonDecoration,
                        textStyle: widget.resetButtonTextStyle,
                        onTap: () {
                          if (!widget.showResetButton!) {
                            return;
                          }

                          Provider.of<StateProvider>(context, listen: false)
                              .moveFirstState();
                          pageController!.animateToPage(0,
                              duration: Duration(milliseconds: 300),
                              curve: Curves.easeIn);

                          if (!cardKey.currentState!.isFront) {
                            cardKey.currentState!.toggleCard();
                          }
                        },
                      ),
                    ))),
          ],
        ),
        Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
          AnimatedOpacity(
            opacity: _currentState == InputState.NUMBER ||
                    _currentState == InputState.DONE
                ? 0
                : 1,
            duration: Duration(milliseconds: 500),
            child: RoundButton(
                decoration: widget.prevButtonDecoration,
                textStyle: widget.prevButtonTextStyle,
                buttonTitle: captions.getCaption('PREV'),
                onTap: () {
                  if (InputState.DONE == _currentState) {
                    return;
                  }

                  if (InputState.NUMBER != _currentState) {
                    pageController!.previousPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeIn);
                  }

                  if (InputState.CVV == _currentState) {
                    cardKey.currentState!.toggleCard();
                  }
                  Provider.of<StateProvider>(context, listen: false)
                      .movePrevState();
                }),
          ),
          SizedBox(
            width: 10,
          ),
          AnimatedOpacity(
            opacity: _currentState == InputState.DONE ? 0 : 1,
            duration: Duration(milliseconds: 500),
            child: RoundButton(
                decoration: widget.nextButtonDecoration,
                textStyle: widget.nextButtonTextStyle,
                buttonTitle: _currentState == InputState.CVV ||
                        _currentState == InputState.DONE
                    ? captions.getCaption('DONE')
                    : captions.getCaption('NEXT'),
                onTap: () {
                  if (InputState.CVV != _currentState) {
                    pageController!.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeIn);
                  }

                  if (InputState.VALIDATE == _currentState) {
                    cardKey.currentState!.toggleCard();
                  }

                  Provider.of<StateProvider>(context, listen: false)
                      .moveNextState();
                }),
          ),
          SizedBox(
            width: 25,
          )
        ])
      ],
    );
  }
}
