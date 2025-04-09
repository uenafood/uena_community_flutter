class VoucherModel {
  final String title;
  final int quantity;
  final String description;
  final String code;
  final String expiredAt;

  const VoucherModel({
    required this.title,
    required this.quantity,
    required this.description,
    required this.code,
    required this.expiredAt,
  });

  // todo : fromJson constructor
}
