import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/globals/app_assets.dart';
import '../globals/app_colors.dart';
import '../globals/app_text_styles.dart';

class MyProjects extends StatefulWidget {
  const MyProjects({super.key});

  @override
  State<MyProjects> createState() => _MyProjectsState();
}

class _MyProjectsState extends State<MyProjects> {
  final onHoverEffet = Matrix4.identity()..scale(1.0);

  List images = <String>[
    AppAssets.work1,
    AppAssets.work2,
    AppAssets.work1,
    AppAssets.work2,
    AppAssets.work1,
    AppAssets.work2,
  ];

  var hoveredIndex;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width,
      color: AppColor.bgColor2,
      alignment: Alignment.center,
      padding: EdgeInsetsDirectional.symmetric(
          vertical: 30, horizontal: size.width * 0.1),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FadeInRight(
            duration: const Duration(milliseconds: 1200),
            child: RichText(
              text: TextSpan(
                text: 'My',
                style: AppTextStyles.headingTextStyle().copyWith(fontSize: 30),
                children: [
                  TextSpan(
                    text: 'Projects',
                    style: AppTextStyles.headingTextStyle()
                        .copyWith(fontSize: 30, color: AppColor.robinEdgeBlue),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          GridView.builder(
              itemCount: images.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisExtent: 280,
                mainAxisSpacing: 24,
                crossAxisSpacing: 24,
              ),
              itemBuilder: (context, index) {
                var image = images[index];
                return FadeInUpBig(
                  duration: Duration(milliseconds: 1600),
                  child: InkWell(
                    onTap: () {},
                    onHover: (value) {
                      setState(() {
                        if (value) {
                          hoveredIndex = index;
                        }
                        else{
                          hoveredIndex = null;
                        }
                      });

                    },
                    child: Stack(children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image(
                          image: AssetImage(image),
                          fit: BoxFit.fill,
                        ),
                      ),
                      Visibility(
                        visible: index == hoveredIndex,
                        child: AnimatedContainer(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: LinearGradient(
                              colors: [
                                AppColor.themeColor.withOpacity(1),
                                AppColor.themeColor.withOpacity(0.9),
                                AppColor.themeColor.withOpacity(0.8),
                                AppColor.themeColor.withOpacity(0.6),
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                          ),
                          padding: EdgeInsetsDirectional.symmetric(
                              horizontal: 14, vertical: 16),
                          duration: Duration(milliseconds: 300),
                          transform:
                              index == hoveredIndex ? onHoverEffet : null,
                          child: Column(
                            children: [
                              Text(
                                'App Development',
                                style: AppTextStyles.heroTextStyle().copyWith(
                                    color: Colors.black87, fontSize: 20),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Text(
                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt',
                                textAlign: TextAlign.center,
                                style: AppTextStyles.normalStyle().copyWith(
                                  color: Colors.black87,
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              IconButton(
                              iconSize: 30,
                                onPressed: () {},
                                icon: Icon(Icons.open_in_browser_rounded),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ]),
                  ),
                );
              })
        ],
      ),
    );
  }
}
