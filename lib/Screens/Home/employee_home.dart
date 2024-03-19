import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:maan_hrm/Screens/Authentication/sign_in.dart';
import 'package:maan_hrm/Screens/Employee%20management/empty_employee.dart';
import 'package:maan_hrm/Screens/Salary%20Statement/empty_salary_statement.dart';
import 'package:maan_hrm/employee_screens/leave_request.dart';
import 'package:maan_hrm/employee_screens/leaves_view_screen.dart';
import 'package:maan_hrm/employee_screens/mark_attendance.dart';
import 'package:maan_hrm/employee_screens/view_attendance.dart';

import '../../constant.dart';

class EmployeeHomeScreen extends StatefulWidget {
  const EmployeeHomeScreen();

  @override
  State<EmployeeHomeScreen> createState() => _EmployeeHomeScreenState();
}

class _EmployeeHomeScreenState extends State<EmployeeHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              Container(
                child: IconButton(
                    onPressed: () {
                      FirebaseAuth.instance.signOut();
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignIn(),
                          ));
                    },
                    icon: Row(
                      children: [
                        const Icon(Icons.logout),
                        Text('log out'),
                      ],
                    )),
              ),
              Container(
                child: Column(
                  children: [
                    Material(
                      elevation: 2.0,
                      child: Container(
                        padding: const EdgeInsets.all(10.0),
                        decoration: const BoxDecoration(
                          border: Border(
                            left: BorderSide(
                              color: Color(0xFF4DCEFA),
                              width: 3.0,
                            ),
                          ),
                          color: Colors.white,
                        ),
                        child: ListTile(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => LeaveForm(),));
                          },
                          leading: const Image(
                              image: AssetImage('images/clientmanagement.png')),
                          title: Text(
                            'request leave',
                            maxLines: 2,
                            style: kTextStyle.copyWith(
                                color: kTitleColor, fontWeight: FontWeight.bold),
                          ),
                          trailing: const Icon(Icons.arrow_forward_ios),
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Material(
                      elevation: 2.0,
                      child: Container(
                        padding: const EdgeInsets.all(10.0),
                        decoration: const BoxDecoration(
                          border: Border(
                            left: BorderSide(
                              color: Color(0xFF4DCEFA),
                              width: 3.0,
                            ),
                          ),
                          color: Colors.white,
                        ),
                        child: ListTile(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => EmployeeScreenAttendance(),));
                          },
                          leading: const Image(
                              image: AssetImage('images/clientmanagement.png')),
                          title: Text(
                            'Mark Attendance',
                            maxLines: 2,
                            style: kTextStyle.copyWith(
                                color: kTitleColor, fontWeight: FontWeight.bold),
                          ),
                          trailing: const Icon(Icons.arrow_forward_ios),
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Material(
                      elevation: 2.0,
                      child: Container(
                        padding: const EdgeInsets.all(10.0),
                        decoration: const BoxDecoration(
                          border: Border(
                            left: BorderSide(
                              color: Color(0xFF4DCEFA),
                              width: 3.0,
                            ),
                          ),
                          color: Colors.white,
                        ),
                        child: ListTile(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => LeaveViewScreen(),));
                          },
                          leading: const Image(
                              image: AssetImage('images/clientmanagement.png')),
                          title: Text(
                            'see leaves',
                            maxLines: 2,
                            style: kTextStyle.copyWith(
                                color: kTitleColor, fontWeight: FontWeight.bold),
                          ),
                          trailing: const Icon(Icons.arrow_forward_ios),
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Material(
                      elevation: 2.0,
                      child: Container(
                        padding: const EdgeInsets.all(10.0),
                        decoration: const BoxDecoration(
                          border: Border(
                            left: BorderSide(
                              color: Color(0xFF4DCEFA),
                              width: 3.0,
                            ),
                          ),
                          color: Colors.white,
                        ),
                        child: ListTile(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => ViewAttendance(),));
                          },
                          leading: const Image(
                              image: AssetImage('images/clientmanagement.png')),
                          title: Text(
                            'see attendance',
                            maxLines: 2,
                            style: kTextStyle.copyWith(
                                color: kTitleColor, fontWeight: FontWeight.bold),
                          ),
                          trailing: const Icon(Icons.arrow_forward_ios),
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
