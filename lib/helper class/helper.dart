import 'package:flutter/material.dart';

class Helper extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;
  final double paddingWidth;
  final Color bgColor;

  const Helper(
      {super.key,
      required this.mobile,
      required this.tablet,
      required this.desktop,
      required this.paddingWidth,
      required this.bgColor});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 768) {
          return Container(
              child: mobile,
            //  height: size.height,
              width: size.width,
              alignment: Alignment.center,
              color: bgColor,
              padding: EdgeInsetsDirectional.symmetric(
                vertical: size.height *0.2,
                horizontal: paddingWidth,
              ));
        } else if (constraints.maxWidth < 1200) {
          return Container(
              child: tablet,
              //height: size.height,
              width: size.width,
              alignment: Alignment.center,
              color: bgColor,
              padding: EdgeInsetsDirectional.symmetric(
                vertical: size.height *0.2,
                horizontal: paddingWidth,
              ));
        } else {
          return Container(
              child: desktop,
             // height: size.height,
              width: size.width,
              alignment: Alignment.center,
              color: bgColor,
              padding: EdgeInsetsDirectional.symmetric(
                vertical: size.height *0.2,
                horizontal: paddingWidth,
              ));
        }
      },
    );
  }
}
