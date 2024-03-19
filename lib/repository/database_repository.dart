import 'package:maan_hrm/models/attendance_model.dart';
import 'package:maan_hrm/models/employee_model.dart';
import 'package:maan_hrm/models/expense_model.dart';
import 'package:maan_hrm/services/database_services.dart';

class DatabaseRepositoryImpl implements DatabaseRepository {
  final service = DatabaseService();

  @override
  Future<void> addEmployeeData(EmployeeModel employeeModel, String uid) {
    return service.addEmployeeData(employeeModel, uid);
  }

  @override
  Future<void> addExpenseData(ExpenseModel expenseModel, String uid) {
    return service.addExpenseData(expenseModel, uid);
  }

  @override
  Future<List<EmployeeModel>> retrieveAllEmployeesData() {
    return service.retrieveAllEmployeesData();
  }

}

abstract class DatabaseRepository {
  Future<void> addEmployeeData(EmployeeModel employeeModel, String uid);

  Future<List<EmployeeModel>> retrieveAllEmployeesData();

  Future<void> addExpenseData(ExpenseModel expenseModel, String uid);
}
