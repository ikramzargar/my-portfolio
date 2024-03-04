import 'package:flutter/material.dart';
import 'package:my_portfolio/globals/app_assets.dart';
import 'package:my_portfolio/globals/app_colors.dart';

class AboutMe extends StatefulWidget {
  const AboutMe({super.key});

  @override
  State<AboutMe> createState() => _AboutMeState();
}

class _AboutMeState extends State<AboutMe> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.bgColor2,
      child: Row(
        children: [
          Image.asset(
            AppAssets.profile2,
            height: 450,
            width: 400,
          ),
        ],
      ),
    );
  }
}
