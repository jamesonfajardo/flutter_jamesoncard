import 'package:flutter/material.dart';

// internal packages
import '../package/responsive.dart';

// external packages
import 'package:url_launcher/url_launcher.dart';

class CardLauncher extends StatelessWidget {
  CardLauncher({
    this.url,
    this.icon,
    this.label,
  });

  final String? url;
  final IconData? icon;
  final String? label;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        switch (url) {
          case null:
            print('url is null');
            break;
          default:
            if (await canLaunch(url!)) {
              await launch(url!);
            } else {
              print('could not launch url');
            }
        }
      },
      child: Container(
        width: Responsive.breakpointMap(
          mediaQuerySizeWidth: MediaQuery.of(context).size.width,
          initialValue: double.infinity,
          mobileFirst: true,
          breakpointMap: {
            576: 400.00,
          },
        ),
        child: Card(
          margin: EdgeInsets.fromLTRB(25, 15, 25, 0),
          child: ListTile(
            leading: Icon(
              icon ?? Icons.ac_unit,
              color: Colors.blueGrey[700],
            ),
            title: Text(label ?? 'card label goes here'),
          ),
        ),
      ),
    );
  }
}
