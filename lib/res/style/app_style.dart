import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../res/colors/app_colors.dart';
import '../../res/dimentions/app_dimension.dart';

class AppStyle {
  // heading
  TextStyle headingTextStyle = TextStyle(
    fontSize: AppDimension().bigText,
    fontWeight: FontWeight.w500,
    color: AppColors().colorPrimaryText,
  );

  TextStyle headingTextSmallStyle = TextStyle(
    fontSize: AppDimension().smallText,
    fontWeight: FontWeight.w500,
    color: AppColors().colorPrimaryText,
  );

  TextStyle headingTextSmallStyleWithLineThrough = TextStyle(
      fontSize: AppDimension().smallText,
      fontWeight: FontWeight.w500,
      color: AppColors().colorPrimaryText,
      decoration: TextDecoration.lineThrough);

  TextStyle subHeadingTextStyle = TextStyle(
      fontSize: AppDimension().defaultText,
      fontWeight: FontWeight.normal,
      color: AppColors().colorSecondaryText);

  TextStyle subHeadingTextSmallStyleWithLineThrough = TextStyle(
      fontSize: AppDimension().smallText,
      fontWeight: FontWeight.w500,
      color: AppColors().colorSecondaryText,
      decoration: TextDecoration.lineThrough);

  TextStyle subHeadingTextSmallStyle = TextStyle(
      fontSize: AppDimension().smallText,
      fontWeight: FontWeight.normal,
      color: AppColors().colorSecondaryText);

  TextStyle appbarTitleStyle = TextStyle(
      fontSize: AppDimension().defaultText,
      fontWeight: FontWeight.w600,
      color: AppColors().colorAppbarTitle);

  TextStyle linkTextStyle = TextStyle(
      fontSize: AppDimension().defaultText,
      fontWeight: FontWeight.w600,
      color: AppColors().colorLink);

  TextStyle whiteTextStyle = TextStyle(
      fontSize: AppDimension().defaultText,
      fontWeight: FontWeight.w600,
      color: Colors.white);

  TextStyle whiteTextSmallStyle = TextStyle(
      fontSize: AppDimension().smallText,
      fontWeight: FontWeight.w600,
      color: Colors.white);
  TextStyle whiteTextVerySmallStyle = TextStyle(
      fontSize: AppDimension().verySmallText,
      fontWeight: FontWeight.w600,
      color: Colors.white);

  TextStyle drawerTextStyle = TextStyle(
      fontSize: AppDimension().mediumText,
      fontWeight: FontWeight.w600,
      color: AppColors().colorAppbarTitle);

  TextStyle drawerSubTextStyle = TextStyle(
      fontSize: AppDimension().mediumText,
      fontWeight: FontWeight.w400,
      color: AppColors().colorPrimary.shade900);

  TextStyle textPrimary = TextStyle(
      fontSize: AppDimension().mediumText,
      fontWeight: FontWeight.w600,
      color: AppColors().colorPrimary);

  TextStyle textPrimarySmall = TextStyle(
      fontSize: AppDimension().smallText,
      fontWeight: FontWeight.w600,
      color: AppColors().colorPrimary);

  TextStyle textDefault = TextStyle(
      fontSize: AppDimension().defaultText,
      fontWeight: FontWeight.w500,
      color: AppColors().colorPrimaryText);

  IconThemeData appbarIconTheme =
      IconThemeData(color: AppColors().colorAppbarTitle);
}
