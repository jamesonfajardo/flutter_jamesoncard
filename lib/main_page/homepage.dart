import 'package:flutter/material.dart';

// external packages
import '../widget/card_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(),
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 50,
              backgroundImage: AssetImage('assets/images/jameson.png'),
            ),
            Text(
              'Jameson F',
              style: TextStyle(
                  fontFamily: 'Pacifico',
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 40),
            ),
            Text(
              'FLUTTER DEVELOPER',
              style: TextStyle(
                fontFamily: 'SourceSansPro',
                color: Colors.teal[50],
                letterSpacing: 3,
              ),
            ),
            SizedBox(
              width: 150,
              child: Divider(
                color: Colors.white,
              ),
            ),
            CardLauncher(
              icon: Icons.email,
              label: 'jameson.fajardo@gmail.com',
              url:
                  'mailto:jameson.fajardo@gmail.com?subject=We\'ve checked your HireMe App&body=Hi Jameson, We\'ve downloaded your HireMe App and we\'re sending this email via the said app. Regards.',
            ),
            CardLauncher(
              icon: Icons.phone,
              label: '+63 939 983 8712',
              url: 'tel:+63 939 983 8712',
            ),
            // CardLauncher(
            //   icon: Icons.message,
            //   label: '+63 939 983 8712',
            //   url: 'sms:+639399838712',
            // ),
            CardLauncher(
              icon: FontAwesomeIcons.linkedin,
              label: 'linkedin.com/in/jamesonf',
              url: 'https://www.linkedin.com/in/jamesonf/',
            ),
          ],
        ),
      ),
    );
  }
}
