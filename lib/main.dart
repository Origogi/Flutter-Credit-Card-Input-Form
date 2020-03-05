import 'package:flutter/material.dart';
import 'package:flutter_credit_card/provider/my_notifier.dart';
import 'package:flutter_credit_card/screens/MainScreen.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MyNotifier(),
      child: Consumer<MyNotifier>(builder: (context, myNotifier, _) {
        return MaterialApp(
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: MainScreen(),
        );
      }),
    );
  }
}
