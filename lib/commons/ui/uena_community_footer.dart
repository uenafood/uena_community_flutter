import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:uena_community_flutter/commons/constants.dart';
import 'package:uena_community_flutter/commons/uena_community_colors.dart';
import 'package:uena_community_flutter/commons/ui/uena_community_text.dart';

class UenaCommunityFooter extends StatelessWidget {
  final bool onlyShowCopyright;

  const UenaCommunityFooter({
    super.key,
    this.onlyShowCopyright = false,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        color: UenaCommunityColors.purpleDark,
        padding: const EdgeInsets.only(
          top: 12.0,
          bottom: 8.0,
          left: 16.0,
          right: 16.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (!onlyShowCopyright) ...[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(Constants.svgAsset("uena_logo")),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const UenaCommunityText(
                        "Download UENA App Now!",
                        alignment: TextAlign.end,
                        color: UenaCommunityColors.white,
                        size: 12.0,
                        weight: FontWeight.w700,
                      ),
                      const SizedBox(height: 8.0),
                      Row(
                        children: [
                          SvgPicture.asset(
                            Constants.svgAsset("ic_download_ios"),
                            width: 90.0,
                            height: 28.0,
                          ),
                          const SizedBox(width: 8.0),
                          SvgPicture.asset(
                            Constants.svgAsset("ic_download_android"),
                            width: 90.0,
                            height: 28.0,
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 24.0),
            ],
            const Row(
              children: [
                Expanded(
                  child: UenaCommunityText(
                    "© Copyright 2025. PT Ujirasa Eka Nagari",
                    size: 10.0,
                    weight: FontWeight.w400,
                    alignment: TextAlign.center,
                    color: UenaCommunityColors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
