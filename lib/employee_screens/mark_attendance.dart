import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:maan_hrm/GlobalComponents/button_global.dart';
import 'package:maan_hrm/Screens/Time%20Attendence/attendence_management.dart';
import 'package:maan_hrm/models/attendance_model.dart';
import 'package:maan_hrm/services/database_services.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../constant.dart';

// ignore_for_file: library_private_types_in_public_api
class EmployeeScreenAttendance extends StatefulWidget {

  @override
  _EmployeeScreenAttendanceState createState() =>
      _EmployeeScreenAttendanceState();
}

class _EmployeeScreenAttendanceState extends State<EmployeeScreenAttendance> {
  bool isPresent = false;
  bool isAbsent = false;
  bool isHalfDay = false;
  bool isHoliday = false;
  bool inTimeSelected = false;
  bool outTimeSelected = false;
  TimeOfDay selectedInTime = TimeOfDay.now();
  TimeOfDay selectedOutTime = TimeOfDay.now();
  final dateController = TextEditingController();
  final db = DatabaseService();
  final fullNameController = TextEditingController();
  final designationController = TextEditingController();


  _submitAttendance() {
    if ((isPresent || isAbsent || isHalfDay || isHoliday) &&
        inTimeSelected &&
        outTimeSelected) {
      final attendanceStatus = isPresent
          ? 'Present'
          : isAbsent
          ? 'Absent'
          : isHalfDay
          ? 'HalfDay'
          : 'Holiday';
        db.submitAttendance(
          AttendanceModel(
              uid: FirebaseAuth.instance.currentUser!.uid,
              attendanceType: attendanceStatus,
              inTime: selectedInTime,
              outTime: selectedOutTime,
              attendanceDate: dateController.text,
              employeeName: fullNameController.text,
              status: 'pending'),
        );
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('attendence successfully marked...'),
            backgroundColor: Colors.greenAccent),
      );
      fullNameController.clear();
      dateController.clear();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text(
                'Please select attendance status and both in-time and out-time.'),
            backgroundColor: Colors.redAccent),
      );
    }
  }

  _selectInTime(BuildContext context) async {
    final TimeOfDay? timeOfDay = await showTimePicker(
      context: context,
      initialTime: selectedInTime,
      initialEntryMode: TimePickerEntryMode.dial,
    );
    if (timeOfDay != null && timeOfDay != selectedInTime) {
      setState(() {
        selectedInTime = timeOfDay;
        inTimeSelected = true;
      });
    }
  }

  _selectOutTime(BuildContext context) async {
    final TimeOfDay? timeOfDay = await showTimePicker(
      context: context,
      initialTime: selectedOutTime,
      initialEntryMode: TimePickerEntryMode.dial,
    );
    if (timeOfDay != null && timeOfDay != selectedOutTime) {
      setState(() {
        selectedOutTime = timeOfDay;
        outTimeSelected = true;
      });
    }
  }

  @override
  void dispose() {
    _selectInTime(context).dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainColor,
      appBar: AppBar(
        backgroundColor: kMainColor,
        elevation: 0.0,
        titleSpacing: 0.0,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          'Mark Attendance',
          maxLines: 2,
          style: kTextStyle.copyWith(
              color: Colors.white, fontWeight: FontWeight.bold),
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
              height: context.height(),
              padding: const EdgeInsets.all(20.0),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0)),
                color: kBgColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    width: context.width(),
                    padding: const EdgeInsets.all(30.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Select Attendance',
                          style: kTextStyle,
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isAbsent = false;
                                  isHalfDay = false;
                                  isHoliday = false;
                                  isPresent = !isPresent;
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.only(
                                    left: 30.0,
                                    right: 30.0,
                                    top: 10.0,
                                    bottom: 10.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: isPresent
                                      ? kMainColor
                                      : kMainColor.withOpacity(0.1),
                                ),
                                child: Text(
                                  'Present',
                                  style: kTextStyle.copyWith(
                                      color:
                                      isPresent ? Colors.white : kMainColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0),
                                ),
                              ),
                            ),
                            const Spacer(),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isAbsent = !isAbsent;
                                  isHalfDay = false;
                                  isHoliday = false;
                                  isPresent = false;
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.only(
                                    left: 30.0,
                                    right: 30.0,
                                    top: 10.0,
                                    bottom: 10.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: isAbsent
                                      ? kAlertColor
                                      : kAlertColor.withOpacity(0.1),
                                ),
                                child: Text(
                                  'Absent',
                                  style: kTextStyle.copyWith(
                                    color:
                                    isAbsent ? Colors.white : kAlertColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isAbsent = false;
                                  isHalfDay = !isHalfDay;
                                  isHoliday = false;
                                  isPresent = false;
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.only(
                                    left: 30.0,
                                    right: 30.0,
                                    top: 10.0,
                                    bottom: 10.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: isHalfDay
                                      ? kHalfDay
                                      : kHalfDay.withOpacity(0.1),
                                ),
                                child: Text(
                                  'Half Day',
                                  style: kTextStyle.copyWith(
                                      color:
                                      isHalfDay ? Colors.white : kHalfDay,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0),
                                ),
                              ),
                            ),
                            const Spacer(),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isAbsent = false;
                                  isHalfDay = false;
                                  isHoliday = !isHoliday;
                                  isPresent = false;
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.only(
                                    left: 30.0,
                                    right: 30.0,
                                    top: 10.0,
                                    bottom: 10.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: isHoliday
                                      ? kGreenColor
                                      : kGreenColor.withOpacity(0.1),
                                ),
                                child: Text(
                                  'Holiday',
                                  style: kTextStyle.copyWith(
                                    color:
                                    isHoliday ? Colors.white : kGreenColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  AppTextField(
                    textFieldType: TextFieldType.NAME,
                    decoration: const InputDecoration(
                      labelText: 'Full Name',
                      hintText: 'MaanTheme',
                      border: OutlineInputBorder(),
                    ),
                    controller: fullNameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter full name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20,),
                  AppTextField(
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
                  Container(
                    width: context.width(),
                    padding: const EdgeInsets.all(30.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Select Attendance',
                          style: kTextStyle,
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Visibility(
                              visible: inTimeSelected,
                              child: Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 60.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.0),
                                      border: Border.all(color: kGreyTextColor),
                                    ),
                                    child: Row(
                                      children: [
                                        TextButton(
                                            onPressed: () async {
                                              _selectInTime(context);
                                            },
                                            child: Text(
                                                "${selectedInTime
                                                    .hour}:${selectedInTime
                                                    .minute} ${selectedInTime
                                                    .period.toString()
                                                    .substring(10, 12)}")),
                                        const Spacer(),
                                        const Icon(
                                          Icons.access_time,
                                          color: kGreyTextColor,
                                        ),
                                        const SizedBox(
                                          width: 8.0,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Visibility(
                              visible: !inTimeSelected,
                              child: Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: AppTextField(
                                    textFieldType: TextFieldType.NAME,
                                    readOnly: true,
                                    onTap: () async {
                                      _selectInTime(context);
                                    },
                                    decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        floatingLabelBehavior:
                                        FloatingLabelBehavior.always,
                                        suffixIcon: Icon(
                                          Icons.access_time,
                                          color: kGreyTextColor,
                                        ),
                                        labelText: 'In Time',
                                        hintText: 'In Time'),
                                  ),
                                ),
                              ),
                            ),
                            Visibility(
                              visible: outTimeSelected,
                              child: Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 60.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.0),
                                      border: Border.all(color: kGreyTextColor),
                                    ),
                                    child: Row(
                                      children: [
                                        TextButton(
                                            onPressed: () async {
                                              _selectOutTime(context);
                                            },
                                            child: Text(
                                                "${selectedOutTime
                                                    .hour}:${selectedOutTime
                                                    .minute} ${selectedOutTime
                                                    .period.toString()
                                                    .substring(10, 12)}")),
                                        const Spacer(),
                                        const Icon(
                                          Icons.access_time,
                                          color: kGreyTextColor,
                                        ),
                                        const SizedBox(
                                          width: 8.0,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Visibility(
                              visible: !outTimeSelected,
                              child: Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: AppTextField(
                                    textFieldType: TextFieldType.NAME,
                                    readOnly: true,
                                    onTap: () async {
                                      _selectOutTime(context);
                                    },
                                    decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        floatingLabelBehavior:
                                        FloatingLabelBehavior.always,
                                        suffixIcon: Icon(
                                          Icons.access_time,
                                          color: kGreyTextColor,
                                        ),
                                        labelText: 'Out Time',
                                        hintText: 'Out Time'),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
                  ButtonGlobal(
                    buttontext: 'Submit Attendance',
                    buttonDecoration:
                    kButtonDecoration.copyWith(color: kMainColor),
                    onPressed: () {
                      _submitAttendance();
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
