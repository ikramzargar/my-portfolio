import 'package:flutter/material.dart';
import 'package:my_portfolio/globals/app_colors.dart';
import 'package:my_portfolio/globals/app_text_styles.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColor.bgColor,
      appBar: AppBar(
        toolbarHeight: 90,
        titleSpacing: 100,
        backgroundColor: AppColor.bgColor,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60),
          child: Row(
            children: [
              Text(
                'Portfolio',
                style: AppTextStyles.headerTextStyle(),
              ),
              const Spacer(),
              Text(
                'Home',
                style: AppTextStyles.headerTextStyle(),
              ),
              const SizedBox(
                width: 30,
              ),
              Text(
                'About',
                style: AppTextStyles.headerTextStyle(),
              ),
              const SizedBox(
                width: 30,
              ),
              Text(
                'Skills',
                style: AppTextStyles.headerTextStyle(),
              ),
              const SizedBox(
                width: 30,
              ),
              Text(
                'Projects',
                style: AppTextStyles.headerTextStyle(),
              ),
              const SizedBox(
                width: 30,
              ),
              Text(
                'Contact',
                style: AppTextStyles.headerTextStyle(),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
            top: size.height * 0.3,
            right: size.width * 0.2,
            left: size.width * 0.2),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hello It\`s Me',
                  style: AppTextStyles.heroTextStyle(),
                ),
                Text(
                  'Ikram Zargar',
                  style: AppTextStyles.headingTextStyle(),
                ),
                Text(
                  'And I\`m a Flutter Developer',
                  style: AppTextStyles.heroTextStyle(),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
