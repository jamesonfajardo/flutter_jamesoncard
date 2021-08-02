import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mi_card/main_page/homepage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(HireMe());
}

class HireMe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => Homepage(),
      },
      initialRoute: '/',
    );
  }
}
