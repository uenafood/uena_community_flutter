import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uena_community_flutter/commons/api/api_service.dart';
import 'package:uena_community_flutter/commons/api/endpoints.dart';
import 'package:uena_community_flutter/commons/models/voucher_model.dart';
import 'package:uena_community_flutter/features/app/cubits/uena_community_state.dart';

class UenaCommunityCubit extends Cubit<UenaCommunityState> {
  UenaCommunityCubit() : super(const UenaCommunityState());

  fetchVouchers({
    required void Function() onSuccess,
    required void Function(String message) onFailure,
  }) {
    if (state.whatsappNumber.isEmpty) {
      onFailure("Mohon isi nomor WhatsApp terlebih dahulu!");
      return;
    }

    emit(state.copy(isLoadingVouchers: true));

    APIService.fetch(
      Endpoints.getVoucherList,
      httpMethod: HttpMethod.post,
      body: {
        "phoneNumber": "62${state.whatsappNumber}",
      },
      onSuccess: (result) {
        final responseData = VoucherListResponse.fromJson(result.data);
        emit(state.copy(
          isLoadingVouchers: false,
          voucherList: responseData.vouchers,
        ));
        onSuccess();
      },
      onFailure: (errorMessage) {
        emit(state.copy(isLoadingVouchers: false));
        onFailure(errorMessage);
      },
    );
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
