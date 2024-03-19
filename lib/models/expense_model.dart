import 'package:cloud_firestore/cloud_firestore.dart';

class ExpenseModel {
  final String employeeId;
  final String expenseDate;
  final String purpose;
  final String amount;

  ExpenseModel({
    required this.employeeId,
    required this.expenseDate,
    required this.purpose,
    required this.amount,
  });

  Map<String, dynamic> toMap() {
    return {
      'employeeId': employeeId,
      'expenseDate': expenseDate,
      'purpose': purpose,
      'amount': amount,
    };
  }


  ExpenseModel.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> doc)
      : employeeId = doc.data()?['employeeId'],
        expenseDate = doc.data()?['expenseDate'],
        purpose = doc.data()?['purpose'],
        amount = doc.data()?['amount'];

  ExpenseModel copyWith({
    String? employeeId,
    String? expenseDate,
    String? purpose,
    String? amount,
  }) {
    return ExpenseModel(
      employeeId: employeeId ?? this.employeeId,
      expenseDate: expenseDate ?? this.expenseDate,
      purpose: purpose ?? this.purpose,
      amount: amount ?? this.amount,
    );
  }
}
