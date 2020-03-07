import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/components/back_card_view.dart';
import 'package:flutter_credit_card/components/front_card_view.dart';
import 'package:flutter_credit_card/components/input_view_pager.dart';
import 'package:flutter_credit_card/components/my_appbar.dart';
import 'package:flutter_credit_card/components/round_button.dart';
import 'package:flutter_credit_card/constanst.dart';
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
    pageController = PageController(
      viewportFraction: 0.92,
      initialPage: 0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: MyAppbar(),
            ),
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
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(top : 10, right: 22),
                child: RoundButton(onTap: () {
                  pageController.nextPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeIn);

                  if (InputState.validate ==
                      Provider.of<StateProvider>(context, listen: false)
                          .getCurrentState()) {
                    cardKey.currentState.toggleCard();
                  }
                  Provider.of<StateProvider>(context, listen: false)
                      .moveNextState();
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
