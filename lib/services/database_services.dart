import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:maan_hrm/models/admin_model.dart';
import 'package:maan_hrm/models/attendance_model.dart';
import 'package:maan_hrm/models/employee_model.dart';
import 'package:maan_hrm/models/expense_model.dart';
import 'package:maan_hrm/models/leave_model.dart';

class DatabaseService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  addEmployeeData(EmployeeModel employeeModel, String uid) async {
    await _db.collection("employee").doc(uid).set(employeeModel.toMap());
    await _db.collection('userRole').doc(uid).set({'user' :'employee'});

  }

  Future<List<EmployeeModel>> retrieveAllEmployeesData() async {
    final snapshot = await _db.collection("employee").get();
    return snapshot.docs
        .map((e) => EmployeeModel.fromDocumentSnapshot(e))
        .toList();
  }

  Future<List<String?>> retrieveAllEmployeeNames() async {
    final snapshot = await _db.collection("employee").get();

    List<String?> employeeNames = snapshot.docs
        .map((e) => EmployeeModel.fromDocumentSnapshot(e).fullName)
        .toList();

    return employeeNames;
  }

  Future<List<String?>> retrieveAllEmployeeId() async {
    final snapshot = await _db.collection("employee").get();

    List<String?> employeeNames = snapshot.docs
        .map((e) => EmployeeModel.fromDocumentSnapshot(e).uid)
        .toList();

    return employeeNames;
  }

  Future<void> submitAttendance(AttendanceModel attendanceData) async {
    try {
      String documentId =
          FirebaseFirestore.instance.collection("attendances").doc().id;

      await _db
          .collection('attendances')
          .doc(documentId)
          .set(attendanceData.toMap());
      await _db.collection("attendances").doc(documentId).update({
        'docID': documentId,
      });
    } catch (e) {
      print(e.toString());
    }
  }
  Future<List<AttendanceModel>> fetchAllAttendance() async {
    try {
      QuerySnapshot<Map<String, dynamic>> snapshot= await _db.collection('attendances').get();
      List<AttendanceModel> attendanceList = snapshot.docs
          .map((doc) => AttendanceModel.fromMap(doc.data()))
          .toList();

      return attendanceList;
    } catch (e) {
      print('Error fetching leave requests: $e');
      throw e;
    }
  }

  Future<List<AttendanceModel>> fetchAttendanceFromUid(String userId) async {
    try {

      QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore.instance
          .collection('attendances')
          .where('uid', isEqualTo: userId)
          .get();

      List<AttendanceModel> attendanceList = snapshot.docs
          .map((doc) => AttendanceModel.fromMap(doc.data()))
          .toList();

      return attendanceList;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }


  addExpenseData(ExpenseModel expenseModel, String uid) async {
    await _db.collection('expenses').doc(uid).set(expenseModel.toMap());
  }

  addAdminData(AdminModel adminModel, String uid) async {
    await _db.collection('adminDetail').doc(uid).set(adminModel.toMap());
    await _db.collection('userRole').doc(uid).set({'user' :'admin'});
  }

  addLeaveRequest(LeaveModel leaveModel) async {
    String documentId =
        FirebaseFirestore.instance.collection("leaveRequest").doc().id;

    await _db
        .collection('leaveRequest')
        .doc(documentId)
        .set(leaveModel.toMap());
    await _db.collection("leaveRequest").doc(documentId).update({
      'uid': documentId,
    });
  }

  Future<List<LeaveModel>> getLeaveRequests() async {
    try {
      final querySnapshot = await _db.collection('leaveRequest').get();
      return querySnapshot.docs
          .map((doc) => LeaveModel.fromMap(doc.data() as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print('Error fetching leave requests: $e');
      throw e;
    }
  }
}
