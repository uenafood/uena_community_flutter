import 'package:flutter/material.dart';
import 'package:uena_community_flutter/commons/uena_community_colors.dart';

enum SnackbarType { success, error }

showSnackbar(
  BuildContext context, {
  required String message,
  required SnackbarType type,
  int durationInSeconds = 1,
}) {
  ScaffoldMessenger.of(context).hideCurrentSnackBar();

  final Color backgroundColor;

  switch (type) {
    case SnackbarType.success:
      backgroundColor = UenaCommunityColors.greenDark;
      break;
    case SnackbarType.error:
      backgroundColor = UenaCommunityColors.redDark;
      break;
  }

  final snackBar = SnackBar(
    duration: Duration(seconds: durationInSeconds),
    content: Text(
      message,
      style: const TextStyle(
        fontSize: 12.0,
      ),
    ),
    backgroundColor: backgroundColor,
    margin: const EdgeInsets.all(16.0),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
    behavior: SnackBarBehavior.floating,
    dismissDirection: DismissDirection.up,
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
