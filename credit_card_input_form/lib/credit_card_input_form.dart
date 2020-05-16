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
  CreditCardInputForm({this.onStateChange});
  
  final Function onStateChange;

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
      child: CreditCardInputImpl(onStateChange: onStateChange),
    );
  }
}

class CreditCardInputImpl extends StatefulWidget {
  final CardInfoCallback onStateChange;

  CreditCardInputImpl({
    @required this.onStateChange,
  });

  @override
  _CreditCardInputImplState createState() => _CreditCardInputImplState();
}

class _CreditCardInputImplState extends State<CreditCardInputImpl> {
  final PageController pageController = PageController(
    viewportFraction: 0.92,
    initialPage: 0,
  );

  final GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();

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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: FlipCard(
            flipOnTouch: false,
            key: cardKey,
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
                    cardKey.currentState.toggleCard();
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
                  cardKey.currentState.toggleCard();
                }

                Provider.of<StateProvider>(context, listen: false)
                    .moveNextState();
              }),
          SizedBox(
            width: 25,
          )
        ])
      ],
    );
  }
}
