// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:maan_hrm/repository/database_repository.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../constant.dart';

class EmployeeList extends StatefulWidget {
  const EmployeeList({Key? key}) : super(key: key);

  @override
  _EmployeeListState createState() => _EmployeeListState();
}

class _EmployeeListState extends State<EmployeeList> {
  final db = DatabaseRepositoryImpl();
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
          'Employee List',
          maxLines: 2,
          style: kTextStyle.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: const [
          Image(
            image: AssetImage('images/employeesearch.png'),
          ),
        ],
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
                borderRadius: BorderRadius.only(topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0)),
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
                          readOnly: true,
                          textFieldType: TextFieldType.NAME,
                          decoration: InputDecoration(
                            labelText: 'Total Employee',
                            hintText: '4',
                            hintStyle: kTextStyle.copyWith(color: kGreyTextColor),
                            labelStyle: kTextStyle.copyWith(color: kTitleColor),
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            border: const OutlineInputBorder(),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20.0,
                      ),
                      Expanded(
                        child: Container(
                          height: 60.0,
                          padding: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            color: kMainColor,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                              Text(
                                'Add Employee',
                                style: kTextStyle.copyWith(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(color: kGreyTextColor.withOpacity(0.5)),
                    ),
                    child: ListTile(
                      onTap: () {
                      },
                      leading: Image.asset('images/emp1.png'),
                      title: Text(
                        'Sahidul islam',
                        style: kTextStyle,
                      ),
                      subtitle: Text(
                        'Designer',
                        style: kTextStyle.copyWith(color: kGreyTextColor),
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        color: kGreyTextColor,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(color: kGreyTextColor.withOpacity(0.5)),
                    ),
                    child: ListTile(
                      onTap: () {

                      },
                      leading: Image.asset('images/emp2.png'),
                      title: Text(
                        'Mehedi Mohammad',
                        style: kTextStyle,
                      ),
                      subtitle: Text(
                        'Manager',
                        style: kTextStyle.copyWith(color: kGreyTextColor),
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        color: kGreyTextColor,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(color: kGreyTextColor.withOpacity(0.5)),
                    ),
                    child: ListTile(
                      onTap: () {
                      },
                      leading: Image.asset('images/emp3.png'),
                      title: Text(
                        'Ibne Riead',
                        style: kTextStyle,
                      ),
                      subtitle: Text(
                        'Developer',
                        style: kTextStyle.copyWith(color: kGreyTextColor),
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        color: kGreyTextColor,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(color: kGreyTextColor.withOpacity(0.5)),
                    ),
                    child: ListTile(
                      onTap: () {
                      },
                      leading: Image.asset('images/emp4.png'),
                      title: Text(
                        'Emily Jones',
                        style: kTextStyle,
                      ),
                      subtitle: Text(
                        'Officer',
                        style: kTextStyle.copyWith(color: kGreyTextColor),
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        color: kGreyTextColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
