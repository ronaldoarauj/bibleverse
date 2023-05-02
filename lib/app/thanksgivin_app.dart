import 'package:flutter/material.dart';
import 'package:thanksgiving/app/theme/theme_config.dart';

import 'home_page.dart';
import 'splash_page.dart';

class ThanksgivinApp extends StatelessWidget {
  const ThanksgivinApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Thanksgivin',
      theme: ThemeConfig.theme,
      home: const SplashPage(),
      routes: {
        '/home': (context) => const Homepage(),
      },
    );
  }
}
