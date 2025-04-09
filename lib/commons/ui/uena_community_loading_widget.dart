import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:uena_community_flutter/commons/uena_community_colors.dart';

enum LoadingWidgetSize { small, mid }

class UenaCommunityLoadingWidget extends StatelessWidget {
  final LoadingWidgetSize size;

  const UenaCommunityLoadingWidget({
    super.key,
    this.size = LoadingWidgetSize.mid,
  });

  @override
  Widget build(BuildContext context) {
    return LoadingAnimationWidget.waveDots(
      color: UenaCommunityColors.white,
      size: size == LoadingWidgetSize.mid ? 20.0 : 10.0,
    );
  }
}
