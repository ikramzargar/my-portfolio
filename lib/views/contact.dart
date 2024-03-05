import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/globals/app_buttons.dart';

import '../globals/app_colors.dart';
import '../globals/app_text_styles.dart';

class Contact extends StatelessWidget {
  const Contact({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width,
      color: AppColor.bgColor2,
      alignment: Alignment.center,
      padding: EdgeInsetsDirectional.symmetric(
          vertical: 30, horizontal: size.width * 0.2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          FadeInRight(
            duration: const Duration(milliseconds: 1200),
            child: RichText(
              text: TextSpan(
                text: 'Contact ',
                style: AppTextStyles.headingTextStyle().copyWith(fontSize: 30),
                children: [
                  TextSpan(
                    text: 'Me',
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
          Row(
            children: [
              Expanded(
                child: Material(
                  borderRadius: BorderRadius.circular(10),
                  elevation: 8,
                  color: Colors.transparent,
                  child: TextField(
                    cursorColor: Colors.white,
                    style: AppTextStyles.normalStyle(),
                    decoration: buildTextFeild(hintText: 'Name'),
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: Material(
                  borderRadius: BorderRadius.circular(10),
                  elevation: 8,
                  color: Colors.transparent,
                  child: TextField(
                    cursorColor: Colors.white,
                    style: AppTextStyles.normalStyle(),
                    decoration: buildTextFeild(hintText: 'Email Address'),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          Row(
            children: [
              Expanded(
                child: Material(
                  borderRadius: BorderRadius.circular(10),
                  elevation: 8,
                  color: Colors.transparent,
                  child: TextField(
                    cursorColor: Colors.white,
                    style: AppTextStyles.normalStyle(),
                    decoration: buildTextFeild(hintText: 'Mobile No.'),
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: Material(
                  borderRadius: BorderRadius.circular(10),
                  elevation: 8,
                  color: Colors.transparent,
                  child: TextField(
                    cursorColor: Colors.white,
                    style: AppTextStyles.normalStyle(),
                    decoration: buildTextFeild(hintText: 'Subject'),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          Material(
            borderRadius: BorderRadius.circular(10),
            elevation: 8,
            color: Colors.transparent,
            child: TextField(
              cursorColor: Colors.white,
              style: AppTextStyles.normalStyle(),
              maxLines: 13,
              decoration: buildTextFeild(hintText: 'Your Message'),
            ),
          ),
          const SizedBox(
            height: 35,
          ),
          AppButtons.buildMaterialButton(onTap: (){}, buttonText: 'Submit')
        ],
      ),
    );
  }

  InputDecoration buildTextFeild({required String hintText}) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: AppTextStyles.comfortaaStylr(),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
      filled: true,
      fillColor: AppColor.bgColor2,
      contentPadding:
          EdgeInsetsDirectional.symmetric(horizontal: 20, vertical: 12),
    );
  }
}
