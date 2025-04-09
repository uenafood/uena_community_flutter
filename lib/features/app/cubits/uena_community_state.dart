import 'package:equatable/equatable.dart';
import 'package:uena_community_flutter/commons/models/voucher_model.dart';

class UenaCommunityState extends Equatable {
  final bool isLoadingVouchers;
  final String whatsappNumber;
  final List<VoucherModel> voucherList;
  final String errorMessage;
  final String successMessage;

  const UenaCommunityState({
    this.isLoadingVouchers = false,
    this.whatsappNumber = "",
    this.voucherList = const [],
    this.errorMessage = "",
    this.successMessage = "",
  });

  UenaCommunityState copy({
    bool? isLoadingVouchers,
    String? whatsappNumber,
    List<VoucherModel>? voucherList,
    String? errorMessage,
    String? successMessage,
  }) {
    return UenaCommunityState(
      isLoadingVouchers: isLoadingVouchers ?? this.isLoadingVouchers,
      whatsappNumber: whatsappNumber ?? this.whatsappNumber,
      voucherList: voucherList ?? this.voucherList,
      errorMessage: errorMessage ?? this.errorMessage,
      successMessage: successMessage ?? this.successMessage,
    );
  }

  @override
  List<Object?> get props => [
        isLoadingVouchers,
        whatsappNumber,
        voucherList,
        errorMessage,
        successMessage,
      ];
}
