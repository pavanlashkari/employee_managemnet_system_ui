import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:maan_hrm/constant.dart';
import 'package:maan_hrm/models/leave_model.dart';
import 'package:maan_hrm/services/database_services.dart';
import 'package:nb_utils/nb_utils.dart';

class LeaveForm extends StatefulWidget {
  LeaveForm({key});

  @override
  State<LeaveForm> createState() => _LeaveFormState();
}

class _LeaveFormState extends State<LeaveForm> {
  final reasonController = TextEditingController();
  final fromDateController = TextEditingController();
  final toDateController = TextEditingController();
  final leaveDayController = TextEditingController();
  final db = DatabaseService();

  void _submitLeave() {
    try {
      db.addLeaveRequest(
          LeaveModel(
              status: 'pending',
              reason: reasonController.text,
              fromDate: fromDateController.text,
              toDate: toDateController.text,
              leaveDay: leaveDayController.text),);
      print('successfully added');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Leave Request is send successfully..'),
        ),
      );
      reasonController.clear();
      fromDateController.clear();
      toDateController.clear();
      leaveDayController.clear();
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('leave form'),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20.0,
          ),
          AppTextField(
            controller: reasonController,
            textFieldType: TextFieldType.NAME,
            decoration: const InputDecoration(
              labelText: 'enter reason',
              hintText: 'reason',
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter reason';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 20.0,
          ),
          AppTextField(
            textFieldType: TextFieldType.NAME,
            readOnly: true,
            onTap: () async {
              var date = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1900),
                  lastDate: DateTime(2100));
              fromDateController.text = date.toString().substring(0, 10);
            },
            controller: fromDateController,
            decoration: const InputDecoration(
                border: OutlineInputBorder(),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                suffixIcon: Icon(
                  Icons.date_range_rounded,
                  color: kGreyTextColor,
                ),
                labelText: 'From Date',
                hintText: '11/09/2021'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please select a joining date';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 20.0,
          ),
          AppTextField(
            textFieldType: TextFieldType.NAME,
            readOnly: true,
            onTap: () async {
              var date = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1900),
                  lastDate: DateTime(2100));
              toDateController.text = date.toString().substring(0, 10);
            },
            controller: toDateController,
            decoration: const InputDecoration(
                border: OutlineInputBorder(),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                suffixIcon: Icon(
                  Icons.date_range_rounded,
                  color: kGreyTextColor,
                ),
                labelText: 'To Date',
                hintText: '11/09/2021'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please select a joining date';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 20.0,
          ),
          AppTextField(
            controller: leaveDayController,
            textFieldType: TextFieldType.NAME,
            decoration: const InputDecoration(
              labelText: 'Leave Day',
              hintText: 'its full day or half day',
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter its full day or half day';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 20.0,
          ),
          const SizedBox(
            height: 20.0,
          ),
          InkWell(
            onTap: () => _submitLeave(),
            child: Container(
              padding: const EdgeInsets.only(
                  left: 30.0, right: 30.0, top: 10.0, bottom: 10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: kMainColor,
              ),
              child: Text(
                'Submit',
                style: kTextStyle.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
