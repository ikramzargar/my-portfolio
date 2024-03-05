import 'package:flutter/material.dart';
import 'package:my_portfolio/globals/app_colors.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 40),
      height: 70,
      width: MediaQuery.of(context).size.width,
      color: AppColor.bgColor2,
      alignment: Alignment.centerRight,
      child: InkWell(
        onTap: (){},
        child: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColor.themeColor,
          ),
          child: const Icon(
            Icons.arrow_upward,
            size: 25,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
