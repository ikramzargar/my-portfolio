import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/globals/app_assets.dart';
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
                  'Hello It`s Me',
                  style: AppTextStyles.heroTextStyle(),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  'Ikram Zargar',
                  style: AppTextStyles.headingTextStyle(),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Text(
                      'And I`m a ',
                      style: AppTextStyles.heroTextStyle(),
                    ),
                    AnimatedTextKit(
                      animatedTexts: [
                        TyperAnimatedText(
                          'Flutter Developer',
                          textStyle: AppTextStyles.heroTextStyle().copyWith(
                            color: Colors.green,
                          ),
                        ),
                      ],
                      pause: const Duration(milliseconds: 1000),
                      displayFullTextOnTap: true,
                      stopPauseOnTap: true,
                      repeatForever: true,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  width: size.width * 0.5,
                  child: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipisci elit,'
                    'sed eiusmod tempor incidunt ut labore et dolore magna aliqua.'
                    'Ut enim ad minim veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam,'
                    'nisi ut aliquid ex ea commodi consequatur.',
                    style: AppTextStyles.normalStyle(),
                  ),
                ),
                const SizedBox(
                  height: 22,
                ),
                Row(
                  children: [
                    buildSocialButtons(asset: AppAssets.facebook),
                    const SizedBox(
                      width: 12,
                    ),
                    buildSocialButtons(asset: AppAssets.twitter),
                    const SizedBox(
                      width: 12,
                    ),
                    buildSocialButtons(asset: AppAssets.linkedin),
                    const SizedBox(
                      width: 12,
                    ),
                    buildSocialButtons(asset: AppAssets.insta),
                    const SizedBox(
                      width: 12,
                    ),
                    buildSocialButtons(asset: AppAssets.github),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  CircleAvatar buildSocialButtons({required String asset}) {
    return CircleAvatar(
      maxRadius: 20,
      backgroundColor: AppColor.themeColor,
      child: CircleAvatar(
        maxRadius: 18,
        backgroundColor: AppColor.bgColor,
        child: Image.asset(
          asset,
          width: 20,
          height: 24,
          color: AppColor.themeColor,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
