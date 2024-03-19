class AdminModel {
  final String companyName;
  final String adminName;
  final String emailAddress;
  final String pnumber;

  AdminModel({
    required this.companyName,
    required this.adminName,
    required this.emailAddress,
    required this.pnumber,
  });

  Map<String, dynamic> toMap() {
    return {
      'companyName': companyName,
      'adminName': adminName,
      'emailAddress': emailAddress,
      'pnumber': pnumber,
    };
  }
}
