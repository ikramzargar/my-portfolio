import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/globals/app_assets.dart';
import 'package:my_portfolio/helper%20class/helper.dart';

import '../globals/app_colors.dart';
import '../globals/app_text_styles.dart';
import 'package:lottie/lottie.dart';

import '../globals/utils.dart';

class MySkills extends StatelessWidget {
  const MySkills({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> skills = [
      "Flutter",
      "Dart",
      "FireBase",
      "Android Studio",
      "Provider",
      "Web Api",
      "C",
      "HTML",
      "CSS"
    ];
    final size = MediaQuery
        .of(context)
        .size;
    return Helper(
      desktop: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: [
          RichText(
            text: TextSpan(
              text: 'My ',
              style: AppTextStyles.headingTextStyle().copyWith(fontSize: 30),
              children: [
                TextSpan(
                  text: 'Skills',
                  style: AppTextStyles.headingTextStyle()
                      .copyWith(fontSize: 30, color: AppColor.highlightColor),
                )
              ],
            ),
          ),
          const SizedBox(height: 40),
          buildProjectGridView(crossAxisCount: 3)
        ],
      ),
      mobile: Column(
        children: [
          RichText(
            text: TextSpan(
              text: 'My ',
              style: AppTextStyles.headingTextStyle().copyWith(fontSize: 30),
              children: [
                TextSpan(
                  text: 'Skills',
                  style: AppTextStyles.headingTextStyle()
                      .copyWith(fontSize: 30, color: AppColor.highlightColor),
                )
              ],
            ),
          ),
          const SizedBox(height: 40),
          buildProjectGridView(crossAxisCount: 1)
        ],
      ),
      tablet: Column(
        children: [
          RichText(
            text: TextSpan(
              text: 'My ',
              style: AppTextStyles.headingTextStyle().copyWith(fontSize: 30),
              children: [
                TextSpan(
                  text: 'Skills',
                  style: AppTextStyles.headingTextStyle()
                      .copyWith(fontSize: 30, color: AppColor.highlightColor),
                )
              ],
            ),
          ),
          const SizedBox(height: 40),
          buildProjectGridView(crossAxisCount: 2)
        ],
      ),
      paddingWidth: 20,
      bgGradient: AppColor.gradient1,
    );
  }

  GridView buildProjectGridView({required int crossAxisCount}) {
    final List<Map<String, String >> skills = [
     { 'name':"Flutter", 'icon': AppAssets.flutterIcon,'link':'https://flutter.dev/'},
     { 'name':"Dart", 'icon': AppAssets.dartIcon,'link':'https://dart.dev/'},
     { 'name':"FireBase", 'icon': AppAssets.firebaseIcon,'link':'https://firebase.google.com/'},
     { 'name':"Android Studio", 'icon': AppAssets.androidStudioIcon,'link':'https://developer.android.com/'},
     { 'name':"Web Api", 'icon': AppAssets.webapiIcon,'link':'https://www.w3schools.com/js/js_api_intro.asp'},
     { 'name':"C", 'icon': AppAssets.cIcon,'link':'https://www.w3schools.com/c/c_intro.php'},
     { 'name':"HTML", 'icon': AppAssets.htmlIcon,'link':'https://www.w3schools.com/html'},
     { 'name':"CSS", 'icon': AppAssets.cssIcon,'link':'https://www.w3schools.com/css'},
    ];

    return GridView.builder(
      itemCount: skills.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        mainAxisExtent: 100,
        mainAxisSpacing: 24,
        crossAxisSpacing: 24,
      ),
      itemBuilder: (context, index) {
        // var image = images[index];
        return Stack(
          alignment: Alignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey
                // image: DecorationImage(
                //     image: AssetImage(image), fit: BoxFit.fill),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Lottie.asset(skills[index]['icon']!,height: 50,width: 50),
                Text(
                  skills[index]['name']!,
                  style: AppTextStyles.heroTextStyle()
                      .copyWith(color: Colors.black87, fontSize: 20),
                ),
                  const SizedBox(height: 15.0),
                IconButton(onPressed: (){
                  Utils().launch(skills[index]['link']!);
                }, icon: const CircleAvatar(
                  maxRadius: 20,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.open_in_new_sharp),
                ),)
              ],
            ),
          ],
        );
      },
    );
  }
}
