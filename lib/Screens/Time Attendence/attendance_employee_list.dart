// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:maan_hrm/Screens/Employee%20management/add_employee.dart';
import 'package:maan_hrm/Screens/Time%20Attendence/mark_attendance.dart';
import 'package:maan_hrm/models/employee_model.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../constant.dart';
import '../../repository/database_repository.dart';

class AttendanceEmployeeList extends StatefulWidget {
  const AttendanceEmployeeList({Key? key}) : super(key: key);

  @override
  _AttendanceEmployeeListState createState() => _AttendanceEmployeeListState();
}

class _AttendanceEmployeeListState extends State<AttendanceEmployeeList> {
  final DatabaseRepositoryImpl db = DatabaseRepositoryImpl();
  final dateController = TextEditingController();
  bool mark = false;
  List<String> selectedEmployees = [];

  @override
  void dispose() {
    dateController.dispose();
    super.dispose();
  }

  void _toggleSelection(String employeeName) {
    setState(() {
      if (selectedEmployees.contains(employeeName)) {
        selectedEmployees.remove(employeeName);
      } else {
        selectedEmployees.add(employeeName);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const AddEmployee(),
            ),
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
      backgroundColor: kMainColor,
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20.0,
            ),
            Container(
              width: context.width(),
              padding: const EdgeInsets.all(20.0),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: AppTextField(
                          textFieldType: TextFieldType.NAME,
                          readOnly: true,
                          onTap: () async {
                            var date = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1900),
                              lastDate: DateTime(2100),
                            );
                            dateController.text =
                                date.toString().substring(0, 10);
                          },
                          controller: dateController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            suffixIcon: Icon(
                              Icons.date_range_rounded,
                              color: kGreyTextColor,
                            ),
                            labelText: 'Date',
                            hintText: '11/09/2021',
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            if (selectedEmployees.isEmpty) {
                              setState(() {
                                mark = !mark;
                              });
                            } else if(dateController.text.isEmpty){
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('please select date'),),);
                            }else
                            {
                              print(dateController.text);
                              print(selectedEmployees);
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => MarkAttendance(
                                      date: dateController.text,
                                      uid: selectedEmployees),
                                ),
                              );
                            }
                          },
                          child: Container(
                            height: 60.0,
                            padding: const EdgeInsets.all(5.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              border: Border.all(color: kMainColor),
                              color: selectedEmployees.isEmpty
                                  ? Colors.white
                                  : kTitleColor,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.person_outline_rounded,
                                  color: selectedEmployees.isEmpty
                                      ? kTitleColor
                                      : Colors.white,
                                ),
                                const SizedBox(
                                  width: 2.0,
                                ),
                                Text(
                                  selectedEmployees.isEmpty
                                      ? 'Mark Attendance'
                                      : 'Continue',
                                  style: kTextStyle.copyWith(
                                    color: selectedEmployees.isEmpty
                                        ? kTitleColor
                                        : Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  FutureBuilder<List<EmployeeModel>>(
                    future: db.retrieveAllEmployeesData(),
                    builder: (BuildContext context,
                        AsyncSnapshot<List<EmployeeModel>> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      } else {
                        List<EmployeeModel> employees = snapshot.data!;
                        return SizedBox(
                          height: MediaQuery.of(context).size.height,
                          child: ListView.separated(
                            itemCount: employees.length,
                            separatorBuilder: (context, index) =>
                                const SizedBox(height: 10),
                            itemBuilder: (context, index) {
                              EmployeeModel employee = employees[index];
                              return Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  border: Border.all(
                                    color: kGreyTextColor.withOpacity(0.5),
                                  ),
                                ),
                                child: mark
                                    ? CheckboxListTile(
                                        shape: const CircleBorder(),
                                        value: selectedEmployees
                                            .contains(employee.uid),
                                        onChanged: (val) {
                                          print(selectedEmployees);
                                          _toggleSelection(employee.uid!);
                                        },
                                        secondary:
                                            Image.asset('images/empty.png'),
                                        title: Text(
                                          employee.fullName!,
                                          style: kTextStyle,
                                        ),
                                        subtitle: Text(
                                          employee.designation!,
                                          style: kTextStyle.copyWith(
                                            color: kGreyTextColor,
                                          ),
                                        ),
                                      )
                                    : GestureDetector(
                                        onTap: () {
                                          print(selectedEmployees);
                                        },
                                        child: ListTile(
                                          leading:
                                              Image.asset('images/empty.png'),
                                          title: Text(
                                            employee.fullName!,
                                            style: kTextStyle,
                                          ),
                                          subtitle: Text(
                                            employee.designation!,
                                            style: kTextStyle.copyWith(
                                              color: kGreyTextColor,
                                            ),
                                          ),
                                        ),
                                      ),
                              );
                            },
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
