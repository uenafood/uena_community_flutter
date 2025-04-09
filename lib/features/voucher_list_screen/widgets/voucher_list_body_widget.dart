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
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: MediaQuery.of(context).size.height,
        ),
        child: IntrinsicHeight(
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
                child: Column(
                  children: [
                    for (int i = 0; i < state.voucherList.length; i++) ...[
                      VoucherCellWidget(
                        voucherModel: state.voucherList[i],
                        onTapped: () async {
                          await Clipboard.setData(
                              ClipboardData(text: state.voucherList[i].code));
                          cubit.updateSuccessMessage("Berhasil Menyalin Kode!");
                        },
                      ),
                      SizedBox(
                          height:
                              i == state.voucherList.length - 1 ? 36.0 : 8.0),
                    ],
                  ],
                ),
              ),
              const Spacer(),
              const UenaCommunityFooter(onlyShowCopyright: true)
            ],
          ),
        ),
      ),
    );
  }
}
