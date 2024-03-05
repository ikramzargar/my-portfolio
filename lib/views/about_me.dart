import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/globals/app_assets.dart';
import 'package:my_portfolio/globals/app_buttons.dart';
import 'package:my_portfolio/globals/app_colors.dart';

import '../globals/app_text_styles.dart';

class AboutMe extends StatefulWidget {
  const AboutMe({super.key});

  @override
  State<AboutMe> createState() => _AboutMeState();
}

class _AboutMeState extends State<AboutMe> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width,
      color: AppColor.bgColor2,
      alignment: Alignment.center,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FadeInRight(
            duration: Duration(milliseconds: 1200),
            child: Image.asset(
              AppAssets.profile2,
              height: 450,
              width: 400,
            ),
          ),
          SizedBox(
            width: 25,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                FadeInRight(
                  duration: const Duration(milliseconds: 1200),
                  child: RichText(
                    text: TextSpan(
                      text: 'About',
                      style: AppTextStyles.headingTextStyle()
                          .copyWith(fontSize: 30),
                      children: [
                        TextSpan(
                          text: 'Me',
                          style: AppTextStyles.headingTextStyle().copyWith(
                              fontSize: 30, color: AppColor.robinEdgeBlue),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                FadeInLeft(
                  duration: Duration(milliseconds: 1400),
                  child: Text(
                    'Flutter Developer!',
                    style: AppTextStyles.heroTextStyle(),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                FadeInLeft(
                  duration: Duration(milliseconds: 1600),
                  child: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt '
                    'ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris '
                    'nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum '
                    'dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt'
                    'mollit anim id est laborum.',
                    style: AppTextStyles.normalStyle(),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                FadeInUp(
                  duration: const Duration(milliseconds: 1800),
                  child: AppButtons.buildMaterialButton(
                      onTap: () {}, buttonText: 'Read More'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
