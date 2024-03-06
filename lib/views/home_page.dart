import 'package:animate_do/animate_do.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/globals/app_assets.dart';
import 'package:my_portfolio/globals/app_buttons.dart';
import 'package:my_portfolio/globals/app_colors.dart';
import 'package:my_portfolio/globals/app_text_styles.dart';
import 'package:my_portfolio/helper%20class/helper.dart';
import 'package:my_portfolio/widgets/profile_animations.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final socialButtons = <String>[
    AppAssets.facebook,
    AppAssets.twitter,
    AppAssets.linkedin,
    AppAssets.insta,
    AppAssets.github,
  ];
  var socialBThoverIndex;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Helper(
      mobile: Column(
        children: [
          buildHomePersonalInfo(size),
          SizedBox(
            height: 25,
          ),
          const ProfileAnimation(),
        ],
      ),
      tablet: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(child: buildHomePersonalInfo(size)),
          const ProfileAnimation(),
        ],
      ),
      desktop: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(child: buildHomePersonalInfo(size)),
          const ProfileAnimation(),
        ],
      ),
      paddingWidth: size.width * 0.1,
      bgGradient: AppColor.gradient1,
    );
  }

  Column buildHomePersonalInfo(Size size) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
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
        ),
        const SizedBox(
          height: 15,
        ),
        FadeInDown(
          duration: const Duration(milliseconds: 1600),
          child: Expanded(
            child: Text(
    'I am a passionate computer science student and Flutter developer with a deep fascination for mobile app technology.',
              style: AppTextStyles.normalStyle(),
            ),
          ),
        ),
        const SizedBox(
          height: 22,
        ),
        FadeInUp(
          duration: const Duration(milliseconds: 1600),
          child: SizedBox(
            height: 48,
            child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {},
                  onHover: (value) {
                    setState(() {
                      if (value) {
                        socialBThoverIndex = index;
                      } else {
                        socialBThoverIndex = null;
                      }
                    });
                  },
                  borderRadius: BorderRadius.circular(550.0),
                  hoverColor: AppColor.themeColor,
                  splashColor: AppColor.lawGreen,
                  child: buildSocialButtons(
                      asset: socialButtons[index],
                      hover: socialBThoverIndex == index ? true : false),
                );
              },
              separatorBuilder: (context, child) => const SizedBox(
                width: 8.0,
              ),
              itemCount: socialButtons.length,
            ),
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
        const SizedBox(
          height: 18,
        ),
      ],
    );
  }

  Ink buildSocialButtons({required String asset, required bool hover}) {
    return Ink(
      width: 45,
      height: 45,
      decoration: BoxDecoration(
        border: Border.all(color: AppColor.themeColor, width: 2.0),
        color: AppColor.bgColor,
        shape: BoxShape.circle,
      ),
      padding: const EdgeInsets.all(6),
      child: Image.asset(
        asset,
        width: 10,
        height: 12,
        color: hover ? AppColor.bgColor : AppColor.themeColor,
        // fit: BoxFit.fill,
      ),
    );
  }
}
