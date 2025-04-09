import 'package:flutter/material.dart';
import 'package:uena_community_flutter/commons/models/voucher_model.dart';
import 'package:uena_community_flutter/commons/uena_community_colors.dart';
import 'package:uena_community_flutter/commons/ui/uena_community_text.dart';

class VoucherCellWidget extends StatelessWidget {
  final VoucherModel voucherModel;
  final void Function() onTapped;

  const VoucherCellWidget({
    super.key,
    required this.voucherModel,
    required this.onTapped,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapped,
      child: Container(
        padding: const EdgeInsets.all(12.0),
        decoration: const BoxDecoration(
          color: UenaCommunityColors.white,
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          boxShadow: [
            BoxShadow(
              color: UenaCommunityColors.grayDarkTransparent,
              blurRadius: 4.0,
              spreadRadius: 0.0,
              offset: Offset(0.0, 4.0),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                UenaCommunityText(
                  voucherModel.title,
                  size: 14.0,
                  weight: FontWeight.bold,
                ),
                const SizedBox(width: 4.0),
                UenaCommunityText(
                  "(x${voucherModel.quantity})",
                  size: 14.0,
                  isItalic: true,
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            UenaCommunityText(
              voucherModel.description,
              size: 12.0,
              alignment: TextAlign.start,
            ),
            const SizedBox(height: 8.0),
            Row(
              children: [
                const UenaCommunityText(
                  "Kode:",
                  size: 12.0,
                ),
                const SizedBox(width: 4.0),
                UenaCommunityText(
                  voucherModel.code,
                  weight: FontWeight.bold,
                  isItalic: true,
                  size: 12.0,
                ),
                const SizedBox(width: 8.0),
                const UenaCommunityText(
                  "Copy Code",
                  color: UenaCommunityColors.purpleDark,
                  weight: FontWeight.bold,
                  size: 10.0,
                ),
                const Spacer(),
                UenaCommunityText(
                  "Expired: ${voucherModel.expiredAt}",
                  size: 10.0,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
