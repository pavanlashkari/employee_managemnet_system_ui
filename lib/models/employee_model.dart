import 'package:cloud_firestore/cloud_firestore.dart';

class EmployeeModel {
  String? uid;
  final String? joiningDate;
  final String? employeeID;
  final String? fullName;
  final String? number;
  final String? email; // Added email field
  final String? designation;
  final List<String>? workingDay;
  final String? basicPay;
  final String? gender;
  final String? password;

  EmployeeModel({
    this.uid,
    required this.joiningDate,
    required this.employeeID,
    required this.fullName,
    required this.number,
    required this.email,
    required this.designation,
    required this.workingDay,
    required this.basicPay,
    required this.gender,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      'joiningDate': joiningDate,
      'employeeID': employeeID,
      'fullName': fullName,
      'number': number,
      'email': email, // Included email in map
      'designation': designation,
      'workingDay': workingDay,
      'basicPay': basicPay,
      'gender': gender,
      'password': password,
    };
  }

  EmployeeModel.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> doc)
      : uid = doc.id,
        joiningDate = doc.data()?['joiningDate'],
        employeeID = doc.data()?['employeeID'],
        fullName = doc.data()?['fullName'],
        number = doc.data()?['number'],
        email = doc.data()?['email'], // Included email in fromDocumentSnapshot
        designation = doc.data()?['designation'],
        workingDay = List<String>.from(doc.data()?['workingDay'] ?? []),
        basicPay = doc.data()?['basicPay'],
        gender = doc.data()?['gender'],
        password = doc.data()?['password'];

  EmployeeModel copyWith({
    String? uid,
    String? joiningDate,
    String? employeeID,
    String? fullName,
    String? number,
    String? email, // Included email in copyWith
    String? designation,
    List<String>? workingDay,
    String? basicPay,
    String? gender,
    String? password,
  }) {
    return EmployeeModel(
      uid: uid ?? this.uid,
      joiningDate: joiningDate ?? this.joiningDate,
      employeeID: employeeID ?? this.employeeID,
      fullName: fullName ?? this.fullName,
      number: number ?? this.number,
      email: email ?? this.email, // Included email in copyWith
      designation: designation ?? this.designation,
      workingDay: workingDay ?? this.workingDay,
      basicPay: basicPay ?? this.basicPay,
      gender: gender ?? this.gender,
      password: password ?? this.password,
    );
  }
}
