class VoucherModel {
  final String title;
  final String description;
  final String code;
  final String? expiredAt;

  const VoucherModel({
    required this.title,
    required this.description,
    required this.code,
    this.expiredAt,
  });

  VoucherModel.fromJson(Map<String, dynamic> json)
      : title = json["title"],
        code = json["code"],
        description = json["description"],
        expiredAt = json["expired_at"];
}

class VoucherListResponse {
  final String phoneNumber;
  final List<VoucherModel> vouchers;

  VoucherListResponse({
    required this.phoneNumber,
    required this.vouchers,
  });

  VoucherListResponse.fromJson(Map<String, dynamic> json)
      : phoneNumber = json["phoneNumber"],
        vouchers = (json["vouchers"] as List)
            .map((data) => VoucherModel.fromJson(data))
            .toList();
}
