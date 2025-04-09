import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uena_community_flutter/commons/ui/uena_community_app_bar.dart';
import 'package:uena_community_flutter/commons/ui/uena_community_snackbar.dart';
import 'package:uena_community_flutter/features/app/cubits/uena_community_cubit.dart';
import 'package:uena_community_flutter/features/app/cubits/uena_community_state.dart';
import 'package:uena_community_flutter/features/voucher_list_screen/widgets/voucher_list_body_widget.dart';

class VoucherListScreen extends StatelessWidget {
  static const routeName = "/voucher_list";

  const VoucherListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UenaCommunityCubit, UenaCommunityState>(
      listener: (context, state) {
        if (state.successMessage.isNotEmpty) {
          showSnackbar(
            context,
            message: state.successMessage,
            type: SnackbarType.success,
            durationInSeconds: 2,
          );

          context.read<UenaCommunityCubit>().removeSnackbar();
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: UenaCommunityAppBar.logoOnly(),
          body: const VoucherListBodyWidget(),
        );
      },
    );
  }
}
