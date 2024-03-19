import 'package:flutter/material.dart';
import 'package:maan_hrm/Screens/Employee%20management/add_employee.dart';
import 'package:maan_hrm/Screens/Employee%20management/employee_details.dart';
import 'package:maan_hrm/models/employee_model.dart';
import 'package:maan_hrm/repository/database_repository.dart';
import '../../constant.dart';

class EmptyEmployeeScreen extends StatelessWidget {
  final DatabaseRepositoryImpl db = DatabaseRepositoryImpl();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddEmployee()),
          );
        },
        backgroundColor: kMainColor,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: kMainColor,
        elevation: 0.0,
        titleSpacing: 0.0,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          'Employee List',
          maxLines: 2,
          style: kTextStyle.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: FutureBuilder<List<EmployeeModel>>(
        future: db.retrieveAllEmployeesData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            List<EmployeeModel> employees = snapshot.data!;
            if (employees.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Image(image: AssetImage('images/empty.png')),
                    const SizedBox(height: 20),
                    Text(
                      'No Data',
                      style: kTextStyle.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    ),
                    Text(
                      'Add your employee',
                      style: kTextStyle.copyWith(color: kGreyTextColor),
                    ),
                  ],
                ),
              );
            } else {
              return ListView.builder(
                itemCount: employees.length,
                itemBuilder: (context, index) {
                  EmployeeModel employee = employees[index];
                  return Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(color: kGreyTextColor.withOpacity(
                              0.5)),
                        ),
                        child: ListTile(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>  EmployeeDetails(uid: employee.uid!,mobileNumber: employee.number!,designation: employee.designation!,employeeId: employee.employeeID!,fullName: employee.fullName!,joiningDate: employee.joiningDate!,workingDay: employee.workingDay!,basicSalary: employee.basicPay!),),);
                          },
                          leading: Image.asset('images/emp2.png'),
                          title: Text(
                            employee.fullName!,
                            style: kTextStyle,
                          ),
                          subtitle: Text(
                            employee.designation!,
                            style: kTextStyle.copyWith(color: kGreyTextColor),
                          ),
                          trailing: const Icon(
                            Icons.arrow_forward_ios,
                            color: kGreyTextColor,
                          ),
                        ),
                      ),const SizedBox(
                        height: 20.0,
                      ),
                    ],
                  );

                  },
              );
            }
          } else {
            return Center(child: Text('No data available'));
          }
        },
      ),
    );
  }
}
