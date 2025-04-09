import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uena_community_flutter/commons/ui/uena_community_footer.dart';
import 'package:uena_community_flutter/commons/ui/uena_community_text.dart';
import 'package:uena_community_flutter/features/app/cubits/uena_community_cubit.dart';
import 'package:uena_community_flutter/features/voucher_list_screen/widgets/voucher_cell_widget.dart';

class VoucherListBodyWidget extends StatelessWidget {
  const VoucherListBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<UenaCommunityCubit>();
    final state = cubit.state;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
            child: UenaCommunityText(
              "Voucher Saya",
              size: 16.0,
              weight: FontWeight.bold,
              alignment: TextAlign.start,
            ),
          ),
          const SizedBox(height: 16.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final voucherModel = state.voucherList[index];
                return VoucherCellWidget(
                  voucherModel: state.voucherList[index],
                  onTapped: () async {
                    await Clipboard.setData(
                        ClipboardData(text: voucherModel.code));
                    cubit.updateSuccessMessage("Berhasil Menyalin Kode!");
                  },
                );
              },
              separatorBuilder: (context, index) => const SizedBox(height: 8.0),
              itemCount: state.voucherList.length,
            ),
          ),
          const SizedBox(height: 48.0),
          const UenaCommunityFooter(onlyShowCopyright: true)
        ],
      ),
    );
  }
}
