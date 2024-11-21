import 'package:flutter/material.dart';

class Helper extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;
  final double paddingWidth;
  final Gradient bgGradient;

  const Helper(
      {super.key,
      required this.mobile,
      required this.tablet,
      required this.desktop,
      required this.paddingWidth,
      required this.bgGradient});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 768) {
          return Container(
              width: /*size.width*/600,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  gradient: bgGradient,
              ),
              padding: EdgeInsetsDirectional.symmetric(
                vertical: size.height *0.2,
                horizontal: 10/*paddingWidth*/,
              ),
              child: mobile,);
        } else if (constraints.maxWidth < 1200) {
          return Container(
              child: tablet,
              //height: size.height,
              width: size.width,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                gradient: bgGradient,
              ),
              // color: bgColor,
              padding: EdgeInsetsDirectional.symmetric(
                vertical: size.height *0.2,
                horizontal: 30/*paddingWidth*/,
              ));
        } else {
          return Container(
              child: desktop,
             // height: size.height,
              width: size.width,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  gradient:bgGradient,
              ),
              // color: bgColor,
              padding: EdgeInsetsDirectional.symmetric(
                vertical: size.height *0.2,
                horizontal: 200/*paddingWidth*/,
              ));
        }
      },
    );
  }
}
