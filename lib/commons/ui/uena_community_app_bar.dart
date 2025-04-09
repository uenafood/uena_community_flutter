import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:uena_community_flutter/commons/constants.dart';
import 'package:uena_community_flutter/commons/uena_community_colors.dart';

class UenaCommunityAppBar {
  static AppBar logoOnly() {
    return AppBar(
      backgroundColor: UenaCommunityColors.purpleDark,
      title: SvgPicture.asset(Constants.svgAsset("app_bar_icon")),
      automaticallyImplyLeading: false,
      centerTitle: false,
    );
  }
}
