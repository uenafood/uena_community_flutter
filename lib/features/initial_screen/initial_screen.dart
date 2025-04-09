import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uena_community_flutter/commons/ui/uena_community_app_bar.dart';
import 'package:uena_community_flutter/commons/ui/uena_community_snackbar.dart';
import 'package:uena_community_flutter/features/app/cubits/uena_community_cubit.dart';
import 'package:uena_community_flutter/features/app/cubits/uena_community_state.dart';
import 'package:uena_community_flutter/features/initial_screen/widgets/initial_screen_body_widget.dart';

class InitialScreen extends StatelessWidget {
  static const routeName = "/initial_screen";

  const InitialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UenaCommunityCubit, UenaCommunityState>(
      listener: (context, state) {
        if (state.errorMessage.isNotEmpty) {
          showSnackbar(
            context,
            message: state.errorMessage,
            type: SnackbarType.error,
          );

          context.read<UenaCommunityCubit>().removeSnackbar();
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: UenaCommunityAppBar.logoOnly(),
          body: const InitialScreenBodyWidget(),
        );
      },
    );
  }
}
