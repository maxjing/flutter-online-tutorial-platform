import 'package:flutter/material.dart';
import '../helper.dart';

class AreaBanner extends StatefulWidget {
  final String subject;
  final String area;
  AreaBanner(this.area, this.subject);

  @override
  _AreaBannerState createState() => _AreaBannerState();
}

class _AreaBannerState extends State<AreaBanner> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: getAreaColor(widget.area),
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
        ),
        child: Container(
          padding: const EdgeInsets.all(3.0),
          child: Text(
            widget.subject,
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 12.0,
                color: Colors.white),
          ),
        ));
  }
}
