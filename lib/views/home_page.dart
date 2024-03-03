import 'package:flutter/material.dart';
import 'package:my_portfolio/globals/app_colors.dart';
import 'package:my_portfolio/globals/app_text_styles.dart';
class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColor.bgColor ,
        title: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 60),
          child: Row(
            children: [
              Text('Portfolio',style: AppTextStyles.headerTextStyle(),),
              Spacer(),
              Text('Home',style: AppTextStyles.headerTextStyle(),),
              SizedBox(width: 20,),
              Text('About',style: AppTextStyles.headerTextStyle(),),
              SizedBox(width: 20,),
              Text('Skills',style: AppTextStyles.headerTextStyle(),),
              SizedBox(width: 20,),
              Text('Projects',style: AppTextStyles.headerTextStyle(),),
              SizedBox(width: 20,),
              Text('Contact',style: AppTextStyles.headerTextStyle(),),
            ],
          ),
        ),
      ),
    );
  }
}
