import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/components/back_card_view.dart';
import 'package:flutter_credit_card/components/front_card_view.dart';
import 'package:flutter_credit_card/components/input_view_pager.dart';
import 'package:flutter_credit_card/components/round_button.dart';
import 'package:flutter_credit_card/constants/constanst.dart';
import 'package:flutter_credit_card/model/card_info.dart';
import 'package:flutter_credit_card/provider/card_cvv_provider.dart';
import 'package:flutter_credit_card/provider/card_name_provider.dart';
import 'package:flutter_credit_card/provider/card_number_provider.dart';
import 'package:flutter_credit_card/provider/card_valid_provider.dart';
import 'package:flutter_credit_card/provider/state_provider.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  PageController pageController;

  GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(children: [
        CreditCardInputForm(
          cardKey: cardKey,
          onStateChange: (currentState, cardInfo) {
            print(currentState);
            print(cardInfo);
          },
        ),
      ])),
    );
  }
}

typedef CardInfoCallback = void Function(
    InputState currentState, CardInfo cardInfo);

class CreditCardInputForm extends StatefulWidget {
  CreditCardInputForm({
    @required this.onStateChange,
    @required this.cardKey,
  });

  final CardInfoCallback onStateChange;

  final GlobalKey<FlipCardState> cardKey;

  @override
  _CreditCardInputFormState createState() => _CreditCardInputFormState();
}

class _CreditCardInputFormState extends State<CreditCardInputForm> {
  final PageController pageController = PageController(
    viewportFraction: 0.92,
    initialPage: 0,
  );

  @override
  void initState() {
    super.initState();
  }

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

    widget.onStateChange(
        currentState,
        CardInfo(
            name: name, cardNumber: cardNumber, validate: valid, cvv: cvv));

    return Container(
      height: 370,
      child: Stack(children: [
        AnimatedOpacity(
          opacity: currentState == InputState.DONE ? 0.15 : 1,
          duration: Duration(milliseconds: 500),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: MyAppbar(),
              // ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: FlipCard(
                  flipOnTouch: false,
                  key: widget.cardKey,
                  front: FrondCardView(),
                  back: BackCardView(),
                ),
              ),
              InputViewPager(
                pageController: pageController,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
                AnimatedOpacity(
                  opacity: currentState == InputState.NUMBER ? 0 : 1,
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
                          widget.cardKey.currentState.toggleCard();
                        }
                        Provider.of<StateProvider>(context, listen: false)
                            .movePrevState();
                      }),
                ),
                SizedBox(
                  width: 10,
                ),
                RoundButton(
                    buttonTitle: currentState == InputState.CVV ||
                            currentState == InputState.DONE
                        ? "Done"
                        : "Next",
                    onTap: () {
                      if (InputState.DONE == currentState) {
                        return;
                      }

                      if (InputState.CVV != currentState) {
                        pageController.nextPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeIn);
                      }

                      if (InputState.VALIDATE == currentState) {
                        widget.cardKey.currentState.toggleCard();
                      }

                      Provider.of<StateProvider>(context, listen: false)
                          .moveNextState();
                    }),
                SizedBox(
                  width: 25,
                )
              ])
            ],
          ),
        ),
        AnimatedOpacity(
          opacity: currentState == InputState.DONE ? 1 : 0,
          duration: Duration(milliseconds: 200),
          child: Align(
            alignment: Alignment.center,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Image.asset("images/checkmark.png", height: 120),
              Text(
                "Complete!!",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              )
            ]),
          ),
        ),
      ]),
    );
  }
}
