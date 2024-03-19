// ignore_for_file: library_private_types_in_public_api

import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:maan_hrm/GlobalComponents/button_global.dart';
import 'package:maan_hrm/Screens/Employee%20management/employee_add_successful.dart';
import 'package:maan_hrm/models/employee_model.dart';
import 'package:maan_hrm/repository/database_repository.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../constant.dart';

class AddEmployee extends StatefulWidget {
  const AddEmployee({Key? key}) : super(key: key);

  @override
  _AddEmployeeState createState() => _AddEmployeeState();
}

class _AddEmployeeState extends State<AddEmployee> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  List<String> data = [
    "Friday",
    "Saturday",
    "Sunday",
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday"
  ];
  List<String> userChecked = [];

  final _auth = FirebaseAuth.instance;

  bool selection = false;
  final dateController = TextEditingController();
  final employeeIDController = TextEditingController();
  final fullNameController = TextEditingController();
  final mobileNumberController = TextEditingController();
  final basicPayController = TextEditingController();
  final emailIDController = TextEditingController();
  String? designation;
  String? gender;
  final db = DatabaseRepositoryImpl();

  List<String> genderList = ["Male", "Female"]; // Define genderList here

  @override
  void dispose() {
    dateController.dispose();
    employeeIDController.dispose();
    fullNameController.dispose();
    mobileNumberController.dispose();
    basicPayController.dispose();
    super.dispose();
  }

  String generateRandomPasswordId({int length = 8}) {
    const charset =
        'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';

    Random random = Random();
    return List.generate(
        length, (index) => charset[random.nextInt(charset.length)]).join();
  }

  void _submitForm() async {
    final form = _formKey.currentState!;
    String randomPasswordId = generateRandomPasswordId();
    bool isValid = form.validate();
    print('Form validation result: $isValid');
    if (isValid) {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
              email: emailIDController.text, password: randomPasswordId);
      db.addEmployeeData(
          EmployeeModel(
            email: emailIDController.text,
            password: randomPasswordId,
            joiningDate: dateController.text,
            employeeID: employeeIDController.text,
            fullName: fullNameController.text,
            number: mobileNumberController.text,
            designation: designation,
            workingDay: userChecked,
            basicPay: basicPayController.text,
            gender: gender,
          ),
          userCredential.user!.uid);
      dateController.clear();
      employeeIDController.clear();
      fullNameController.clear();
      mobileNumberController.clear();
      basicPayController.clear();
      emailIDController.clear();
      // Reset dropdown values
      setState(() {
        designation = 'Designer';
        gender = 'Male';
        userChecked.clear();
        selection = false;
      });

      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => EmployeeAddSuccessful(
            email: emailIDController.text, pass: randomPasswordId),
      ));
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('employee successfully added'),
        backgroundColor: Colors.green,
      ));

    } else {

    }
  }

  DropdownButton<String> getDesignation() {
    List<DropdownMenuItem<String>> dropDownItems = [];
    for (String des in designations) {
      var item = DropdownMenuItem(
        value: des,
        child: Text(des),
      );
      dropDownItems.add(item);
    }
    return DropdownButton(
      items: dropDownItems,
      value: designation,
      onChanged: (value) {
        setState(() {
          designation = value!;
        });
      },
    );
  }

  DropdownButton<String> getGender() {
    List<DropdownMenuItem<String>> dropDownItems = [];
    for (String gender in genderList) {
      // Use genderList here
      var item = DropdownMenuItem(
        value: gender,
        child: Text(gender),
      );
      dropDownItems.add(item);
    }
    return DropdownButton(
      items: dropDownItems,
      value: gender,
      onChanged: (value) {
        setState(() {
          gender = value!;
        });
      },
    );
  }

  void _onSelected(bool selected, String dataName) {
    if (selected == true) {
      setState(() {
        userChecked.add(dataName);
      });
    } else {
      setState(() {
        userChecked.remove(dataName);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    designation = 'Designer';
    gender = 'Male';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainColor,
      appBar: AppBar(
        backgroundColor: kMainColor,
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          'Add Employee',
          style: kTextStyle.copyWith(
              color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0)),
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20.0,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Image.asset('images/employeeaddimage.png'),
                        ),
                        Expanded(
                          flex: 2,
                          child: Column(
                            children: [
                              AppTextField(
                                textFieldType: TextFieldType.NAME,
                                readOnly: true,
                                onTap: () async {
                                  var date = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(1900),
                                      lastDate: DateTime(2100));
                                  dateController.text =
                                      date.toString().substring(0, 10);
                                },
                                controller: dateController,
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.always,
                                    suffixIcon: Icon(
                                      Icons.date_range_rounded,
                                      color: kGreyTextColor,
                                    ),
                                    labelText: 'Joining Date',
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
                                textFieldType: TextFieldType.PHONE,
                                decoration: const InputDecoration(
                                  labelText: 'Employee ID',
                                  hintText: '543223',
                                  border: OutlineInputBorder(),
                                ),
                                controller: employeeIDController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter full name';
                                  }
                                  return null;
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
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
                    const SizedBox(
                      height: 20.0,
                    ),
                    AppTextField(
                      textFieldType: TextFieldType.PHONE,
                      decoration: const InputDecoration(
                        labelText: 'Mobile Number',
                        hintText: '+880 1767 543223',
                        border: OutlineInputBorder(),
                      ),
                      controller: mobileNumberController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter mobile number';
                        }
                        // You can implement more complex phone number validation if needed
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    AppTextField(
                      textFieldType: TextFieldType.EMAIL,
                      decoration: const InputDecoration(
                        labelText: 'Email Id',
                        hintText: 'demo@gmail.com',
                        border: OutlineInputBorder(),
                      ),
                      controller: emailIDController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter full name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Visibility(
                      visible: !selection,
                      child: SizedBox(
                        height: 60.0,
                        child: FormField(
                          builder: (FormFieldState<dynamic> field) {
                            return InputDecorator(
                              decoration: InputDecoration(
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                  labelText: 'Working Day',
                                  labelStyle: kTextStyle,
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(5.0))),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selection = true;
                                  });
                                },
                                child: Text(userChecked.isEmpty
                                    ? 'Select Working Day'
                                    : userChecked.join(",")),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    Visibility(
                      visible: selection,
                      child: Column(
                        children: [
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: data.length,
                            itemBuilder: (context, i) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 10.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: CheckboxListTile(
                                    title: Text(data[i]),
                                    value: userChecked.contains(data[i]),
                                    onChanged: (val) {
                                      _onSelected(val!, data[i]);
                                    },
                                  ),
                                ),
                              );
                            },
                          ),
                          ButtonGlobal(
                              buttontext: 'Add Days',
                              buttonDecoration: kButtonDecoration.copyWith(
                                  color: kMainColor),
                              onPressed: () {
                                setState(() {
                                  selection = false;
                                });
                              })
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: AppTextField(
                            textFieldType: TextFieldType.PHONE,
                            decoration: const InputDecoration(
                              labelText: 'Basic Pay',
                              hintText: '\$00.00',
                              border: OutlineInputBorder(),
                            ),
                            controller: basicPayController,
                          ),
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        Expanded(
                          flex: 1,
                          child: Row(
                            children: [
                              const SizedBox(
                                width: 5.0,
                              ),
                              Container(
                                padding: const EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  border: Border.all(color: kMainColor),
                                ),
                                child: Text(
                                  'Monthly',
                                  style:
                                      kTextStyle.copyWith(color: kMainColor),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 60.0,
                child: FormField(
                  builder: (FormFieldState<dynamic> field) {
                    return InputDecorator(
                      decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          labelText: 'Select Designation',
                          labelStyle: kTextStyle,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0))),
                      child:
                          DropdownButtonHideUnderline(child: getDesignation()),
                    );
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select a designation';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              SizedBox(
                height: 60.0,
                child: FormField(
                  builder: (FormFieldState<dynamic> field) {
                    return InputDecorator(
                      decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          labelText: 'Select Gender',
                          labelStyle: kTextStyle,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0))),
                      child: DropdownButtonHideUnderline(child: getGender()),
                    );
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select a gender';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              ButtonGlobal(
                buttontext: 'Sign Up',
                buttonDecoration: kButtonDecoration.copyWith(color: kMainColor),
                onPressed: _submitForm,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
