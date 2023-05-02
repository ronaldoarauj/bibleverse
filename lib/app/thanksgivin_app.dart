import 'dart:async';

import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:thanksgiving/app/theme/theme_config.dart';
import 'package:thanksgiving/main.dart';

import 'home_page.dart';
import 'splash_page.dart';

class ThanksgivinApp extends StatefulWidget {
  const ThanksgivinApp({super.key});

  @override
  State<ThanksgivinApp> createState() => _ThanksgivinAppState();
}

class _ThanksgivinAppState extends State<ThanksgivinApp> {

  late final StreamSubscription<InternetConnectionStatus> listener;

@override
  void initState() {
    super.initState();
    listener = InternetConnectionChecker().onStatusChange.listen((status) { 
      final notifier = ConnectionNotifier.of(context);
      notifier.value = status == InternetConnectionStatus.connected ? true : false;
    });
  }

  @override
  void dispose() {
    listener.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Thanksgivin',
      theme: ThemeConfig.theme,
      home: const SplashPage(),
      routes: {
        '/home': (context) => const Homepage(),
        '/voltar':(context) => const SplashPage(),
      },
    );
  }
}
