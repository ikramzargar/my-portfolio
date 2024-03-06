import 'package:flutter/material.dart';
import 'package:my_portfolio/views/about_me.dart';
import 'package:my_portfolio/views/contact.dart';
import 'package:my_portfolio/views/footer.dart';
import 'package:my_portfolio/views/home_page.dart';
import 'package:my_portfolio/views/my_projects.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import '../globals/app_colors.dart';
import '../globals/app_text_styles.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();
  final ScrollOffsetListener scrollOffsetListener =
      ScrollOffsetListener.create();
  final ItemScrollController _itemScrollController = ItemScrollController();
  final onMenuHover = Matrix4.identity()..scale(1.0);
  final menuItems = <String>[
    'Home',
    'About',
    //'Skills',
    'Projects',
    'Contact',
  ];
  var menuIndex = 0;

  final screenList = const <Widget>[
    HomePage(),
    AboutMe(),
    MyProjects(),
    Contact(),
    Footer(),
  ];

  Future scrollTo({required int index}) async {
    _itemScrollController
        .scrollTo(
      index: index,
      duration: Duration(seconds: 2),
      curve: Curves.fastLinearToSlowEaseIn,
    )
        .whenComplete(() {
      setState(() {
        menuIndex = index;
      });
    });
  }

  final yourScrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: AppColor.gradient1,
          ),
        ),
        toolbarHeight: 70,
        backgroundColor: Colors.transparent,
        titleSpacing: 40,
        elevation: 2,
        title: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth < 768) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Portfolio',
                    style: AppTextStyles.headerTextStyle(),
                  ),
                  const Spacer(),
                  PopupMenuButton(
                    icon: const Icon(
                      Icons.menu_sharp,
                      size: 32,
                      color: Colors.white,
                    ),
                    color: AppColor.bgColor2,
                    position: PopupMenuPosition.under,
                    constraints:
                        BoxConstraints.tightFor(width: size.width * 0.9),
                    itemBuilder: (BuildContext context) => menuItems
                        .asMap()
                        .entries
                        .map(
                          (e) => PopupMenuItem(
                            onTap: () {
                              scrollTo(index: e.key);
                            },
                            child: Text(
                              e.value,
                              style: AppTextStyles.headerTextStyle(),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ],
              );
            } else {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Portfolio',
                    style: AppTextStyles.headerTextStyle(),
                  ),
                  const Spacer(),
                  SizedBox(
                    height: 30,
                    child: ListView.separated(
                      itemCount: menuItems.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, child) => SizedBox(width: 8),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            scrollTo(index: index);
                          },
                          borderRadius: BorderRadius.circular(100),
                          onHover: (value) {
                            setState(() {
                              if (value) {
                                menuIndex = index;
                              } else {
                                menuIndex = 0;
                              }
                            });
                          },
                          child: buildNavBarAnimatedContainer(
                              index, menuIndex == index ? true : false),
                        );
                      },
                    ),
                  ),
                  const SizedBox(width: 30),
                ],
              );
            }
          },
        ),
      ),
      body: ScrollablePositionedList.builder(
        itemCount: screenList.length,
        itemScrollController: _itemScrollController,
        itemPositionsListener: itemPositionsListener,
        scrollOffsetListener: scrollOffsetListener,
        itemBuilder: (context, index) {
          return screenList[index];
        },
      ),
    );
  }

  AnimatedContainer buildNavBarAnimatedContainer(int index, bool hover) {
    return AnimatedContainer(
      alignment: Alignment.center,
      width: hover ? 80 : 75,
      duration: const Duration(milliseconds: 200),
      transform: hover ? onMenuHover : null,
      child: Text(
        menuItems[index],
        style: AppTextStyles.headerTextStyle()
            .copyWith(color: hover ? Colors.green : Colors.white),
      ),
    );
  }
}
