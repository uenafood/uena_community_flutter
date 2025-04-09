import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uena_community_flutter/commons/models/voucher_model.dart';
import 'package:uena_community_flutter/features/app/cubits/uena_community_state.dart';

class UenaCommunityCubit extends Cubit<UenaCommunityState> {
  UenaCommunityCubit() : super(const UenaCommunityState());

  fetchVouchers({
    required void Function() onSuccess,
    required void Function(String message) onFailure,
  }) {
    // todo : fetch using wa numbers
    if (state.whatsappNumber.isEmpty) {
      onFailure("Mohon isi nomor WhatsApp terlebih dahulu!");
      return;
    }

    emit(state.copy(isLoadingVouchers: true));

    Future.delayed(const Duration(seconds: 2), () {
      emit(
        state.copy(
          isLoadingVouchers: false,
          voucherList: List.generate(
            20,
            (index) => VoucherModel(
              title: "April Barokah 45%",
              quantity: index,
              description:
                  "Promo khusus April untuk pembelian di Kasir dengan minimum transaksi 50rb.",
              code: "49RT$index",
              expiredAt: "12-12-2025",
            ),
          ),
        ),
      );

      onSuccess();
    });
  }

  updateWhatsappNumber(String value) {
    emit(state.copy(whatsappNumber: value));
  }

  removeSnackbar() {
    emit(state.copy(
      successMessage: "",
      errorMessage: "",
    ));
  }

  updateSuccessMessage(String value) {
    emit(state.copy(successMessage: value));
  }

  updateErrorMessage(String value) {
    emit(state.copy(errorMessage: value));
  }
}
