import 'package:flutter/material.dart';
import 'package:uena_community_flutter/commons/uena_community_colors.dart';
import 'package:uena_community_flutter/features/app/uena_community_router.dart';
import 'package:uena_community_flutter/features/initial_screen/initial_screen.dart';

class UenaCommunityApp extends StatelessWidget {
  const UenaCommunityApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: UenaCommunityColors.grayLight,
      alignment: Alignment.center,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 500),
        child: MaterialApp(
          title: "UENA Community",
          debugShowCheckedModeBanner: false,
          initialRoute: InitialScreen.routeName,
          theme: ThemeData(useMaterial3: true),
          onGenerateRoute: (settings) => UenaCommunityRouter.generateRoute(
            settings,
            context,
          ),
        ),
      ),
    );
  }
}
