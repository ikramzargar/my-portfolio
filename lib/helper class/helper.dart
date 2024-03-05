import 'package:flutter/material.dart';

class Helper extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

  const Helper(
      {super.key,
      required this.mobile,
      required this.tablet,
      required this.desktop});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 768) {
          return Container(
              child: mobile,
              height: size.height,
              width: size.width,
              alignment: Alignment.center,
              padding: EdgeInsetsDirectional.symmetric(
                vertical: 35,
                horizontal: size.width * 0.05,
              ));
        } else if (constraints.maxWidth < 1200) {
          return Container(
              child: tablet,
              height: size.height,
              width: size.width,
              alignment: Alignment.center,
              padding: EdgeInsetsDirectional.symmetric(
                horizontal: size.width * 0.03,
              ));
        } else {
          return Container(
              child: desktop,
              height: size.height,
              width: size.width,
              alignment: Alignment.center,
              padding: EdgeInsetsDirectional.symmetric(
                horizontal: size.width * 0.08,
              ));
        }
      },
    );
  }
}
