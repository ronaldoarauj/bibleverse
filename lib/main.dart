import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'app/thanksgivin_app.dart';

class ConnectionNotifier extends InheritedNotifier<ValueNotifier<bool>> {
  const ConnectionNotifier({
    super.key,
    required super.notifier,
    required super.child,
  });

  static ValueNotifier<bool> of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<ConnectionNotifier>()!
        .notifier!;
  }
}

void main() async{
  final hasConnection = await InternetConnectionChecker().hasConnection;
  runApp(
    ConnectionNotifier(
      notifier: ValueNotifier(hasConnection),
      child: const ThanksgivinApp(),
    ),
  );
}
