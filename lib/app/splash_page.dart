import 'package:flutter/material.dart';
import 'package:thanksgiving/app/helpers/size_extensions.dart';
import 'package:thanksgiving/app/theme/app_button.dart';
import 'package:thanksgiving/main.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final hasConnection = ConnectionNotifier.of(context).value;
    final asset = hasConnection ? 'network' : 'no_connection';
    if (asset != 'network') {
      return Scaffold(
        body: Center(
          // child: Lottie.asset('assets/$asset.json'),
          child: Text(asset),
        ),
      );
    } else {
      return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/Novo Projeto.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          body: ColoredBox(
            color: const Color(0XFF140E0E),
            child: Stack(
              children: [
                // Align(
                //   alignment: Alignment.bottomCenter,
                //   child: SizedBox(
                //     width: context.screenWidth,
                //     child: Image.asset(
                //       'assets/images/lanche.png',
                //       fit: BoxFit.cover,
                //     ),
                //   ),
                // ),
                Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: context.percentHeight(.30),
                      ),
                      Image.asset('assets/images/Novo Projeto.png'),
                      const SizedBox(
                        height: 80,
                      ),
                      AppButton(
                        width: context.percentWidth(.6),
                        height: 35,
                        label: 'ACESSAR',
                        onPressed: () {
                          Navigator.of(context).popAndPushNamed('/home');
                        },
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }
}
