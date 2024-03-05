import 'package:flutter/material.dart';
import 'package:my_portfolio/views/home_page.dart';
import '../globals/app_colors.dart';
import '../globals/app_text_styles.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final onMenuHover = Matrix4.identity()..scale(1.0);
  final menuItems = <String>[
    'Home',
    'About',
    'Skills',
    'My Projects',
    'Contact',
  ];
  var menuIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: AppColor.bgColor,
      appBar: AppBar(
        toolbarHeight: 90,
        titleSpacing: 30,
        backgroundColor: AppColor.bgColor,
        elevation: 0,
        title: LayoutBuilder(builder: (context, constraints) {
          if (constraints.maxWidth < 768) {
            return Row(
              children: [
                Text(
                  'Portfolio',
                  style: AppTextStyles.headerTextStyle(),
                ),
                const Spacer(),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.menu_sharp,
                      size: 32,
                      color: Colors.white,
                    ))
              ],
            );
          } else {
            return Row(
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
                        child: buildNavBar(
                            index, menuIndex == index ? true : false),
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
            );
          }
        }),
      ),
      body: HomePage(),
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
