import 'package:animate_do/animate_do.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/globals/app_assets.dart';
import 'package:my_portfolio/globals/app_buttons.dart';
import 'package:my_portfolio/globals/app_colors.dart';
import 'package:my_portfolio/globals/app_text_styles.dart';
import 'package:my_portfolio/views/about_me.dart';
import 'package:my_portfolio/views/contact.dart';
import 'package:my_portfolio/views/my_projects.dart';
import 'package:my_portfolio/widgets/profile_animations.dart';

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
          top: size.height * 0.05,
          // right: size.width * 0.1,
          // left: size.width * 0.1,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FadeInDown(
                      duration: const Duration(milliseconds: 1200),
                      child: Text(
                        'Hello It`s Me',
                        style: AppTextStyles.heroTextStyle(),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    FadeInRight(
                      duration: const Duration(milliseconds: 1400),
                      child: Text(
                        'Ikram Zargar',
                        style: AppTextStyles.headingTextStyle(),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    FadeInLeft(
                      duration: const Duration(milliseconds: 1400),
                      child: Row(
                        children: [
                          Text(
                            'And I`m a ',
                            style: AppTextStyles.heroTextStyle(),
                          ),
                          AnimatedTextKit(
                            animatedTexts: [
                              TyperAnimatedText(
                                'Flutter Developer',
                                textStyle:
                                    AppTextStyles.heroTextStyle().copyWith(
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
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    FadeInDown(
                      duration: const Duration(milliseconds: 1600),
                      child: SizedBox(
                        width: size.width * 0.5,
                        child: Text(
                          'Lorem ipsum dolor sit amet, consectetur adipisci elit,'
                          'sed eiusmod tempor incidunt ut labore et dolore magna aliqua.'
                          'Ut enim ad minim veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam,'
                          'nisi ut aliquid ex ea commodi consequatur.',
                          style: AppTextStyles.normalStyle(),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 22,
                    ),
                    FadeInUp(
                      duration: const Duration(milliseconds: 1600),
                      child: Row(
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
                      ),
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    FadeInUp(
                      duration: const Duration(milliseconds: 1800),
                      child: AppButtons.buildMaterialButton(
                          onTap: () {}, buttonText: 'Download Cv'),
                    ),
                  ],
                ),
                ProfileAnimation(),
              ],
            ),
            const SizedBox(
              height: 220,
            ),
            const AboutMe(),
            const MyProjects(),
            const Contact(),
          ],
        ),
      ),
    );
  }

  // Ink buildSocialButtons({required String asset, required bool hover}) {
  //   return Ink(
  //     width: 45,
  //     height: 45,
  //     decoration: BoxDecoration(
  //       border: Border.all(color: AppColor.themeColor, width: 2.0),
  //       color: AppColor.bgColor,
  //       shape: BoxShape.circle,
  //     ),
  //     padding: const EdgeInsets.all(6),
  //     child: Image.asset(
  //       asset,
  //       width: 10,
  //       height: 12,
  //       color: hover ? AppColor.bgColor : AppColor.themeColor,
  //       // fit: BoxFit.fill,
  //     ),
  //   );
  // }

  Ink buildSocialButtons({required String asset}) {
    return Ink(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.green, width: 3.0),
        color: Colors.greenAccent,
        shape: BoxShape.circle,
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(500.0),
        splashColor: AppColor.lawGreen,
        hoverColor: AppColor.aqua,
        onTap: () {},
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
      ),
    );
  }
}
