import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:thanksgiving/app/helpers/size_extensions.dart';
import 'package:thanksgiving/app/theme/text_styles.dart';

import 'theme/app_button.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late Map<String, dynamic> message = {};

  Future<void> getMessage() async {
    try {
      final response = await Dio()
          .get('https://www.abibliadigital.com.br/api/verses/nvi/random');
      final jsonData = response.data;
      setState(() {
        message = jsonData;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getMessage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Thanksgivin'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 16.0),
            if (message.isNotEmpty && message['book'] != null) ...[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  message['text'],
                  style: context.textStyles.textBold.copyWith(
                    fontSize: 24.0,
                  ),
                  // style: const TextStyle(
                  //   fontSize: 24.0,
                  //   fontWeight: FontWeight.bold,
                  // ),
                ),
              ),
              const SizedBox(height: 16.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  '${message['book']['name']} ${message['chapter']}:${message['number']}',
                  style: context.textStyles.textLight.copyWith(
                    fontSize: 18.0,
                  ),
                  // style: TextStyle(fontSize: 18.0),
                ),
              ),
              const SizedBox(height: 16.0),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                // child: Text(
                //   '- ${message['book']['author']}',
                //   style: TextStyle(fontSize: 18.0),
                // ),
              ),
              const SizedBox(height: 16.0),
            ],
            if (message.isEmpty || message['book'] == null)
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'Carregando...',
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
            Center(
              child: AppButton(
                width: context.percentWidth(.6),
                height: 35,
                label: 'VOLTAR',
                onPressed: () {
                  Navigator.of(context).popAndPushNamed('/voltar');
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
