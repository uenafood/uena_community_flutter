import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uena_community_flutter/commons/constants.dart';
import 'package:uena_community_flutter/commons/uena_community_colors.dart';
import 'package:uena_community_flutter/commons/ui/uena_community_button.dart';
import 'package:uena_community_flutter/commons/ui/uena_community_footer.dart';
import 'package:uena_community_flutter/commons/ui/uena_community_text.dart';
import 'package:uena_community_flutter/commons/ui/uena_community_text_field.dart';
import 'package:uena_community_flutter/features/app/cubits/uena_community_cubit.dart';
import 'package:uena_community_flutter/features/voucher_list_screen/voucher_list_screen.dart';

class InitialScreenBodyWidget extends StatelessWidget {
  const InitialScreenBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<UenaCommunityCubit>();
    final state = cubit.state;

    return SingleChildScrollView(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: MediaQuery.of(context).size.height,
        ),
        child: IntrinsicHeight(
          child: Container(
            color: UenaCommunityColors.purpleLight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 52.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Image.asset(
                    Constants.webpAsset("community_landing"),
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(height: 12.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: UenaCommunityColors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(12.0),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: UenaCommunityColors.grayDarkTransparent,
                          blurRadius: 8.0,
                          spreadRadius: 0.0,
                          offset: Offset(0.0, 2.0),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const UenaCommunityText(
                            "Dapatkan Promo Khusus di UENA Community",
                            size: 14.0,
                            weight: FontWeight.bold,
                            alignment: TextAlign.start,
                          ),
                          const SizedBox(height: 16.0),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const UenaCommunityText(
                                "+62",
                                alignment: TextAlign.center,
                                weight: FontWeight.bold,
                              ),
                              const SizedBox(width: 12.0),
                              Expanded(
                                child: UenaCommunityTextField(
                                  placeholder: "No WhatsApp Kamu",
                                  inputType: TextInputType.number,
                                  onValueChanged: (value) =>
                                      cubit.updateWhatsappNumber(value),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16.0),
                          Row(
                            children: [
                              Expanded(
                                child: UenaCommunityButton(
                                  text: "Klaim / Cek Voucher",
                                  isLoading: state.isLoadingVouchers,
                                  onTap: () => cubit.fetchVouchers(
                                    onSuccess: () => Navigator.of(context)
                                        .pushNamed(VoucherListScreen.routeName),
                                    onFailure: (message) =>
                                        cubit.updateErrorMessage(message),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                const UenaCommunityFooter(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
