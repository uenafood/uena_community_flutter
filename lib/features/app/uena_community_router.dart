import 'package:flutter/material.dart';
import 'package:uena_community_flutter/features/initial_screen/initial_screen.dart';
import 'package:uena_community_flutter/features/voucher_list_screen/voucher_list_screen.dart';

class UenaCommunityRouter {
  static Route<dynamic> generateRoute(
    RouteSettings settings,
    BuildContext context,
  ) {
    switch (settings.name) {
      case VoucherListScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => const VoucherListScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const InitialScreen(),
        );
    }
  }
}
