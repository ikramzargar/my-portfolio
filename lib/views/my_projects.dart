  import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/globals/app_assets.dart';
import 'package:my_portfolio/globals/utils.dart';
import '../globals/app_colors.dart';
import '../globals/app_text_styles.dart';
import '../helper class/helper.dart';

class MyProjects extends StatefulWidget {
  const MyProjects({Key? key}) : super(key: key);

  @override
  State<MyProjects> createState() => _MyProjectsState();
}

class _MyProjectsState extends State<MyProjects> {
  final onH0verEffect = Matrix4.identity()..scale(0.9);

  List images = <String>[
    AppAssets.project1,
    AppAssets.work2,
    AppAssets.work2,
    AppAssets.work2,
    AppAssets.work2,
    AppAssets.work2,
  ];

  var hoveredIndex;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Helper(
      mobile: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildProjectText(),
          const SizedBox(height: 40.0),
          buildProjectGridView(crossAxisCount: 1)
        ],
      ),
      tablet: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildProjectText(),
          SizedBox(height: 40.0),
          buildProjectGridView(crossAxisCount: 2)
        ],
      ),
      desktop: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildProjectText(),
          const SizedBox(height: 40.0),
          buildProjectGridView(crossAxisCount: 3),
        ],
      ),
      paddingWidth: size.width * 0.1,
     // bgGradient: AppColor.gradient1,
    );
  }

  GridView buildProjectGridView({required int crossAxisCount}) {
    List<Map<String, String>> projects = [
      {
        'title':'SkillHire',
        'body':'SkillHire is a Flutter app connecting homeowners with handyman service providers. Users can post jobs, browse providers, '
            'and specify locations using Google Maps API, '
            'while providers can manage availability and find jobs. It uses Firebase Authentication and Firestore for secure data handling.',
        'link':'https://github.com/ikramzargar/SkillHire',
      },
      {
        'title':'Meals',
        'body':'The Meals App, built entirely in Flutter, allows users to explore categorized recipes, view detailed cooking steps,'
            ' and favorite meals for easy access. It offers a clean and intuitive interface for seamless meal planning.',
        'link':'https://github.com/ikramzargar/meals',
      },
      {
        'title':'Habitly',
        'body':'Habitly is a Flutter app that helps users build better habits by creating tasks, setting reminders, and marking them as done. '
            'With notifications and an intuitive interface, it simplifies daily habit tracking and progress monitoring.',
        'link':'https://github.com/ikramzargar/habitly',
      },
      {
        'title':'Tic Tac Toe',
        'body':'A classic Tic Tac Toe game built in Flutter, offering a simple and intuitive interface for two players to compete. '
            ' Enjoy seamless gameplay with an elegant design, all implemented in pure Flutter.',
        'link':'https://github.com/ikramzargar/tic-tac-toe',
      },
      {
        'title':'Expense Tracker',
        'body':'The Expense Tracker app, built in Flutter, helps users manage their finances by tracking expenses and categorizing them. Fully responsive,'
            ' it offers a seamless experience across devices, with an intuitive interface for monitoring spending effectively.',
        'link':'https://github.com/ikramzargar/expense_tracker',
      },
      {
        'title':'BMI Calculator',
        'body':'The BMI Calculator app, built in Flutter, allows users to easily calculate their Body Mass Index and understand their health status.'
            ' With a responsive design and user-friendly interface, it offers a seamless experience across all devices.',
        'link':'https://github.com/ikramzargar/bmi-calculator',
      },

    ];
    return GridView.builder(
      itemCount: projects.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        mainAxisExtent: 280,
        mainAxisSpacing: 24,
        crossAxisSpacing: 24,
      ),
      itemBuilder: (context, index) {
        return FadeInUpBig(
          duration: const Duration(milliseconds: 1600),
          child: InkWell(
            onTap: () {
              Utils().launch(projects[index]['link']!);
            },
            onHover: (value) {
              setState(() {
                if (value) {
                  hoveredIndex = index;
                } else {
                  hoveredIndex = null;
                }
              });
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 600),
                  transform: index == hoveredIndex ? onH0verEffect : null,
                  curve: Curves.easeIn,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 14, vertical: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey,
                    boxShadow:[BoxShadow(color: AppColor.highlightColor,blurRadius: 10)] ,

                  ),
                  child: Column(
                    children: [
                      Text(
                      projects[index]['title']!,
                        style: AppTextStyles.heroTextStyle()
                            .copyWith(color: Colors.black87, fontSize: 20),
                      ),
                      SizedBox(height: 15.0),
                      Text(
                        projects[index]['body']!,
                        style: AppTextStyles.normalStyle()
                            .copyWith(color: Colors.black87),
                        textAlign: TextAlign.center,
                        maxLines: 7,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 30.0),
                      // InkWell(
                      //   onTap: (){
                      //     Utils().launch(projects[index]['link']!);
                      //   },
                      //   child: const CircleAvatar(
                      //     maxRadius: 25,
                      //     backgroundColor: Colors.white,
                      //     child: Icon(Icons.open_in_browser_rounded),
                      //   ),
                      // )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  FadeInDown buildProjectText() {
    return FadeInDown(
      duration: const Duration(milliseconds: 1200),
      child: RichText(
        text: TextSpan(
          text: 'My ',
          style: AppTextStyles.headingTextStyle().copyWith(fontSize: 30.0),
          children: [
            TextSpan(
              text: 'Projects',
              style: AppTextStyles.headingTextStyle()
                  .copyWith(fontSize: 30.0, color: Colors.green),
            )
          ],
        ),
      ),
    );
  }
}
