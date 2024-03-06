import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_text_styles.dart';

class AppButtons {
  static MaterialButton buildMaterialButton(
      {required VoidCallback onTap, required String buttonText}) {
    return MaterialButton(
      onPressed: onTap,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      color: Colors.green,
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide.none,
      ),
      height: 46,
      minWidth: 120,
      hoverColor: AppColor.aqua,
      elevation: 6,
      splashColor: AppColor.lawGreen,
      focusElevation: 12,
      child: Text(buttonText, style: AppTextStyles.headerTextStyle()),
    );
  }
}
