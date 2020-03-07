import 'package:flutter/material.dart';
import 'package:flutter_credit_card/constanst.dart';
import 'package:provider/provider.dart';
import 'package:flutter_credit_card/provider/card_number_provider.dart';

class InputViewPager extends StatelessWidget {
  final pageController;

  InputViewPager({this.pageController});

  final titleMap = {
    0: 'Card Number',
    1: 'Cardholder Name',
    2: 'Valid Thru',
    3: 'Security Code(CVC)'
  };

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 120,
        child: PageView.builder(
            physics: NeverScrollableScrollPhysics(),
            controller: pageController,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: InputForm(
                    title: titleMap[index],
                    index: index,
                    pageController: pageController),
              );
            },
            itemCount: titleMap.length));
  }
}

class InputForm extends StatefulWidget {
  final String title;
  final int index;
  final PageController pageController;

  InputForm({@required this.title, this.index, this.pageController});

  @override
  _InputFormState createState() => _InputFormState();
}

class _InputFormState extends State<InputForm> {
  var opacicy = 0.3;

  void onChange() {
    setState(() {
      if (widget.index == widget.pageController.page.round()) {
        opacicy = 1;
      } else {
        opacicy = 0.3;
      }
    });
  }

  @override
  void initState() {
    super.initState();

    if (widget.index == 0) {
      opacicy = 1;
    }

    widget.pageController.addListener(onChange);
  }

  @override
  void dispose() {
    widget.pageController.removeListener(onChange);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: opacicy,
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              widget.title,
              style: TextStyle(fontSize: 15, color: Colors.black38),
            ),
            SizedBox(
              height: 15,
            ),
            TextField(
              
              onChanged: (newValue) {
                if (widget.index == InputState.number.index) {
                  Provider.of<CardNumberProvider>(context).setNumber(newValue);
                }
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderSide: BorderSide(width: 0.5, color: Colors.black38),
                    borderRadius: BorderRadius.circular(5)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
