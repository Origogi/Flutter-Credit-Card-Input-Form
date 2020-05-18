import 'package:flip_card/flip_card.dart';
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

typedef CardInfoCallback = void Function(
    InputState currentState, CardInfo cardInfo);

class CreditCardInputForm extends StatelessWidget {
  CreditCardInputForm(
      {this.onStateChange,
      this.cardHeight,
      this.frondCardColor,
      this.backCardColor});

  final Function onStateChange;
  final double cardHeight;
  final Color frondCardColor;
  final Color backCardColor;

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
        frondCardColor: frondCardColor,
        cardHeight: cardHeight,
      ),
    );
  }
}

class CreditCardInputImpl extends StatefulWidget {
  final CardInfoCallback onCardModelChanged;
  final double cardHeight;
  final Color frondCardColor;
  final Color backCardColor;

  CreditCardInputImpl(
      {this.onCardModelChanged,
      this.cardHeight,
      this.frondCardColor,
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

  @override
  Widget build(BuildContext context) {
    final currentState =
        Provider.of<StateProvider>(context, listen: true).getCurrentState();

    final name = Provider.of<CardNameProvider>(context, listen: true).cardName;

    final cardNumber =
        Provider.of<CardNumberProvider>(context, listen: true).cardNumber;

    final valid =
        Provider.of<CardValidProvider>(context, listen: true).cardValid;

    final cvv = Provider.of<CardCVVProvider>(context, listen: true).cardCVV;

    widget.onCardModelChanged(
        currentState,
        CardInfo(
            name: name, cardNumber: cardNumber, validate: valid, cvv: cvv));

    double cardWidth =
        MediaQuery.of(context).size.width - (2 * cardHorizontalpadding);

    double cardHeight;
    if (widget.cardHeight != null && widget.cardHeight > 0) {
      cardHeight = widget.cardHeight;
    }
    else {
      cardHeight = cardWidth / cardRatio;
    }

    final frondCardColor = widget.frondCardColor != null ? widget.frondCardColor : const Color(0xFF5D5D5E);
    final backCardColor = widget.frondCardColor != null ? widget.backCardColor : const Color(0xFF5D5D5E);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: FlipCard(
            speed: 300,
            flipOnTouch: currentState == InputState.DONE,
            key: cardKey,
            front: FrondCardView(height: cardHeight, bgColor : frondCardColor),
            back: BackCardView(height: cardHeight, bgColor : backCardColor),
          ),
        ),
        AnimatedOpacity(
          opacity: currentState == InputState.DONE ? 0 : 1,
          duration: Duration(milliseconds: 500),
          child: InputViewPager(
            pageController: pageController,
          ),
        ),
        Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
          AnimatedOpacity(
            opacity: currentState == InputState.NUMBER ||
                    currentState == InputState.DONE
                ? 0
                : 1,
            duration: Duration(milliseconds: 500),
            child: RoundButton(
                buttonTitle: "Prev",
                onTap: () {
                  if (InputState.DONE == currentState) {
                    return;
                  }

                  if (InputState.NUMBER != currentState) {
                    pageController.previousPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeIn);
                  }

                  if (InputState.CVV == currentState) {
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
            opacity: currentState == InputState.DONE ? 0 : 1,
            duration: Duration(milliseconds: 500),
            child: RoundButton(
                buttonTitle: currentState == InputState.CVV ||
                        currentState == InputState.DONE
                    ? "Done"
                    : "Next",
                onTap: () {
                  if (InputState.CVV != currentState) {
                    pageController.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeIn);
                  }

                  if (InputState.VALIDATE == currentState) {
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
