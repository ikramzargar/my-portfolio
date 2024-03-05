import 'package:animate_do/animate_do.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/globals/app_assets.dart';
import 'package:my_portfolio/globals/app_buttons.dart';
import 'package:my_portfolio/globals/app_colors.dart';
import 'package:my_portfolio/globals/app_text_styles.dart';
import 'package:my_portfolio/views/about_me.dart';
import 'package:my_portfolio/views/contact.dart';
import 'package:my_portfolio/views/footer.dart';
import 'package:my_portfolio/views/my_projects.dart';
import 'package:my_portfolio/widgets/profile_animations.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final onMenuHover = Matrix4.identity()..scale(1.0);
  final menuItems = <String>[
    'Home',
    'About',
    'Skills',
    'My Projects',
    'Contact',
  ];
  final socialButtons = <String>[
    AppAssets.facebook,
    AppAssets.twitter,
    AppAssets.linkedin,
    AppAssets.insta,
    AppAssets.github,
  ];
  var socialBThoverIndex;
  var menuIndex = 0;
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
              SizedBox(
                height: 30,
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {},
                      borderRadius: BorderRadius.circular(100),
                      onHover: (value) {
                        setState(() {
                          if (value) {
                            menuIndex == index;
                          } else {
                            menuIndex = 0;
                          }
                        });
                      },
                      child: buildNavBar(index, menuIndex == index ? true : false),
                    );
                  },
                  separatorBuilder: (context, child) => SizedBox(
                    width: 8,
                  ),
                  itemCount: menuItems.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          top: size.height * 0.05,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.symmetric(
                  vertical: 30, horizontal: size.width * 0.1),
              child: Row(
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
                                    hover: socialBThoverIndex == index
                                        ? true
                                        : false),
                              );
                            },
                            separatorBuilder: (context, child) =>
                                const SizedBox(
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
                    ],
                  ),
                  ProfileAnimation(),
                ],
              ),
            ),
            const SizedBox(
              height: 220,
            ),
            // const AboutMe(),
            // const MyProjects(),
            // const Contact(),
            // const Footer(),
          ],
        ),
      ),
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

  AnimatedContainer buildNavBar(int index, bool hover) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      alignment: Alignment.center,
      width: hover ? 80 : 75,
      transform: hover ? onMenuHover : null,
      child: Text(
        menuItems[index],
        style: AppTextStyles.headerTextStyle().copyWith(
          color: hover ? AppColor.themeColor : Colors.white,
        ),
      ),
    );
  }
}
