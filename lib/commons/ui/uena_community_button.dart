import 'package:flutter/material.dart';
import 'package:uena_community_flutter/commons/uena_community_colors.dart';
import 'package:uena_community_flutter/commons/ui/uena_community_loading_widget.dart';
import 'package:uena_community_flutter/commons/ui/uena_community_text.dart';

class UenaCommunityButton extends StatelessWidget {
  final String text;
  final Function()? onTap;
  final bool isLoading;

  const UenaCommunityButton({
    super.key,
    required this.text,
    this.onTap,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: UenaCommunityColors.purpleDark,
        elevation: 0.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(12.0),
        child: isLoading
            ? const UenaCommunityLoadingWidget(size: LoadingWidgetSize.mid)
            : UenaCommunityText(
                text,
                color: UenaCommunityColors.white,
                size: 14.0,
                weight: FontWeight.w700,
              ),
      ),
    );
  }
}
