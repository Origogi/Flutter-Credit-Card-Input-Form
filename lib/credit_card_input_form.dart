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

import 'constants/constanst.dart';

typedef CardInfoCallback = void Function(
    InputState currentState, CardInfo cardInfo);

class CreditCardInputForm extends StatelessWidget {
  CreditCardInputForm(
      {this.onStateChange,
      this.cardHeight,
      this.frontCardColor,
      this.backCardColor,
      this.showResetButton = true});

  final Function onStateChange;
  final double cardHeight;
  final Color frontCardColor;
  final Color backCardColor;
  final bool showResetButton;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => StateProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CardNumberProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CardNameProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CardValidProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CardCVVProvider(),
        )
      ],
      child: CreditCardInputImpl(
        onCardModelChanged: onStateChange,
        backCardColor: backCardColor,
        frontCardColor: frontCardColor,
        cardHeight: cardHeight,
        showResetButton: showResetButton,
      ),
    );
  }
}

class CreditCardInputImpl extends StatefulWidget {
  final CardInfoCallback onCardModelChanged;
  final double cardHeight;
  final Color frontCardColor;
  final Color backCardColor;
  final bool showResetButton;

  CreditCardInputImpl(
      {this.onCardModelChanged,
      this.cardHeight,
      this.showResetButton,
      this.frontCardColor,
      this.backCardColor});

  @override
  _CreditCardInputImplState createState() => _CreditCardInputImplState();
}

class _CreditCardInputImplState extends State<CreditCardInputImpl> {
  final PageController pageController = PageController(
    viewportFraction: 0.92,
    initialPage: 0,
  );

  final GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();

  final cardHorizontalpadding = 12;
  final cardRatio = 16.0 / 9.0;

  var _currentState = InputState.NUMBER;

  @override
  Widget build(BuildContext context) {
    final newState = Provider.of<StateProvider>(context).getCurrentState();

    final name = Provider.of<CardNameProvider>(context).cardName;

    final cardNumber = Provider.of<CardNumberProvider>(context).cardNumber;

    final valid = Provider.of<CardValidProvider>(context).cardValid;

    final cvv = Provider.of<CardCVVProvider>(context).cardCVV;

    if (newState != _currentState) {
      _currentState = newState;

      Future(() {
        widget.onCardModelChanged(
            _currentState,
            CardInfo(
                name: name, cardNumber: cardNumber, validate: valid, cvv: cvv));
      });
    }

    double cardWidth =
        MediaQuery.of(context).size.width - (2 * cardHorizontalpadding);

    double cardHeight;
    if (widget.cardHeight != null && widget.cardHeight > 0) {
      cardHeight = widget.cardHeight;
    } else {
      cardHeight = cardWidth / cardRatio;
    }

    final frontCardColor = widget.frontCardColor != null
        ? widget.frontCardColor
        : const Color(0xFF5D5D5E);
    final backCardColor = widget.frontCardColor != null
        ? widget.backCardColor
        : const Color(0xFF5D5D5E);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: FlipCard(
            speed: 300,
            flipOnTouch: _currentState == InputState.DONE,
            key: cardKey,
            front: FrontCardView(height: cardHeight, bgColor: frontCardColor),
            back: BackCardView(height: cardHeight, bgColor: backCardColor),
          ),
        ),
        Stack(
          children: [
            AnimatedOpacity(
              opacity: _currentState == InputState.DONE ? 0 : 1,
              duration: Duration(milliseconds: 500),
              child: InputViewPager(
                pageController: pageController,
              ),
            ),
            Align(
                alignment: Alignment.center,
                child: AnimatedOpacity(
                    opacity: widget.showResetButton &&
                            _currentState == InputState.DONE
                        ? 1
                        : 0,
                    duration: Duration(milliseconds: 500),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ResetButton(
                        onTap: () {
                          if (!widget.showResetButton) {
                            return;
                          }

                          Provider.of<StateProvider>(context, listen: false)
                              .moveFirstState();
                          pageController.animateToPage(0,
                              duration: Duration(milliseconds: 300),
                              curve: Curves.easeIn);

                          if (!cardKey.currentState.isFront) {
                            cardKey.currentState.toggleCard();
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
                buttonTitle: "Prev",
                onTap: () {
                  if (InputState.DONE == _currentState) {
                    return;
                  }

                  if (InputState.NUMBER != _currentState) {
                    pageController.previousPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeIn);
                  }

                  if (InputState.CVV == _currentState) {
                    cardKey.currentState.toggleCard();
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
                buttonTitle: _currentState == InputState.CVV ||
                        _currentState == InputState.DONE
                    ? "Done"
                    : "Next",
                onTap: () {
                  if (InputState.CVV != _currentState) {
                    pageController.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeIn);
                  }

                  if (InputState.VALIDATE == _currentState) {
                    cardKey.currentState.toggleCard();
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
