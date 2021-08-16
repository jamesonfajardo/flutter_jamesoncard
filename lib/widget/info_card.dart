import 'package:flutter/material.dart';

// internal packages
import '../package/responsive.dart';

class InfoCard extends StatelessWidget {
  InfoCard({
    this.icon,
    this.label,
  });

  final IconData? icon;
  final String? label;

  @override
  Widget build(BuildContext context) {
    return Container(
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
          title: Text(label ?? 'label goes here'),
        ),
      ),
    );
  }
}
