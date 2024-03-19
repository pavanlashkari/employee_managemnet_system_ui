// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:maan_hrm/GlobalComponents/button_global.dart';
import 'package:maan_hrm/Screens/Employee%20management/employee_list.dart';
import 'package:maan_hrm/constant.dart';
import 'package:nb_utils/nb_utils.dart';

class EmployeeAddSuccessful extends StatefulWidget {
  const EmployeeAddSuccessful(
      {Key? key, required this.email, required this.pass})
      : super(key: key);

  final String email;
  final String pass;

  @override
  _EmployeeAddSuccessfulState createState() => _EmployeeAddSuccessfulState();
}

class _EmployeeAddSuccessfulState extends State<EmployeeAddSuccessful> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kMainColor,
      appBar: AppBar(
        backgroundColor: kMainColor,
        elevation: 0.0,
        titleSpacing: 0.0,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          'Employee Added Successfully',
          maxLines: 2,
          style: kTextStyle.copyWith(
              color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20.0,
          ),
          Expanded(
            child: Container(
              width: context.width(),
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
                    padding: const EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Please download app form Playstore',
                          style:
                              kTextStyle.copyWith(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          'Please clicking on the below link:',
                          style: kTextStyle.copyWith(color: kGreyTextColor),
                        ),
                        Text(
                          'httpl://bit.ly/hryu3a',
                          style: kTextStyle.copyWith(color: kMainColor),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    width: context.width(),
                    padding: const EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Employee Login details',
                          style:
                              kTextStyle.copyWith(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'User: ',
                                style: kTextStyle.copyWith(
                                  color: kTitleColor,
                                ),
                              ),
                              TextSpan(
                                text: widget.email,
                                style: kTextStyle.copyWith(
                                  color: kGreyTextColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Password: ',
                                style: kTextStyle.copyWith(
                                  color: kTitleColor,
                                ),
                              ),
                              TextSpan(
                                text: widget.pass,
                                style: kTextStyle.copyWith(
                                  color: kGreyTextColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  ButtonGlobal(
                      buttontext: 'Share Details With Employee',
                      buttonDecoration:
                          kButtonDecoration.copyWith(color: kMainColor),
                      onPressed: () {
                        const EmployeeList().launch(context);
                      }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
