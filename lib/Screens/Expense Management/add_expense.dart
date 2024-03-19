import 'package:flutter/material.dart';
import 'package:maan_hrm/GlobalComponents/button_global.dart';
import 'package:maan_hrm/Screens/Expense%20Management/expense_list.dart';
import 'package:maan_hrm/constant.dart';
import 'package:maan_hrm/models/expense_model.dart';
import 'package:maan_hrm/repository/database_repository.dart';
import 'package:maan_hrm/services/database_services.dart';
import 'package:nb_utils/nb_utils.dart';

class AddExpense extends StatefulWidget {
  const AddExpense({Key? key}) : super(key: key);

  @override
  _AddExpenseState createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  late DatabaseService _dbService;
  List<String> employeeNames = [];
  List<String> employeeIds = [];
  final db = DatabaseRepositoryImpl();
  String employee = '';
  String purpose = 'Marketing';
  bool selection = false;
  final dateController = TextEditingController();
  final expenseController = TextEditingController();

  @override
  void dispose() {
    dateController.dispose();
    super.dispose();
  }

  Future<void> fetchEmployeeNames() async {
    List<String?> fetchedNames = await _dbService.retrieveAllEmployeeNames();
    print(fetchedNames);
    setState(() {
      employeeNames = fetchedNames.whereType<String>().toList();
    });
  }

  Future<void> fetchEmployeeId() async {
    List<String?> fetchedIds = await _dbService.retrieveAllEmployeeId();
    setState(() {
      employeeIds = fetchedIds.whereType<String>().toList();
    });
  }

  DropdownButton<String> getEmployee() {
    List<DropdownMenuItem<String>> dropDownItems = [];
    for (int i = 0; i < employeeIds.length; i++) {
      var item = DropdownMenuItem(
        value: employeeIds[i],
        child: Text(employeeNames[i]),
      );
      dropDownItems.add(item);
    }
    return DropdownButton(
      items: dropDownItems,
      value: employeeIds.isNotEmpty ? employeeIds.first : null,
      onChanged: (value) {
        setState(() {
          employee = value!;
          print(employee);
        });
      },
    );
  }

  DropdownButton<String> getPurpose() {
    List<DropdownMenuItem<String>> dropDownItems = [];
    for (String gender in expensePurpose) {
      var item = DropdownMenuItem(
        value: gender,
        child: Text(gender),
      );
      dropDownItems.add(item);
    }
    return DropdownButton(
      items: dropDownItems,
      value: purpose,
      onChanged: (value) {
        setState(() {
          purpose = value!;
        });
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _dbService = DatabaseService();
    fetchEmployeeNames();
    fetchEmployeeId();
    print(employeeNames);
  }

  void _submitForm() {
    try {
      db.addExpenseData(
          ExpenseModel(
              employeeId: employee,
              expenseDate: dateController.text,
              purpose: purpose,
              amount: expenseController.text),
          employee);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('successfully inserted'),
        ),
      );
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const ExpenseList(),
      ));
    } catch (e) {
      print(e.toString());
    }
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
          'Add Expense',
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
              height: context.height(),
              padding: const EdgeInsets.all(20.0),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0)),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20.0,
                  ),
                  SizedBox(
                    height: 60.0,
                    child: FormField(
                      builder: (FormFieldState<dynamic> field) {
                        return InputDecorator(
                          decoration: InputDecoration(
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              labelText: 'Select Employee',
                              labelStyle: kTextStyle,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0))),
                          child:
                              DropdownButtonHideUnderline(child: getEmployee()),
                        );
                      },
                    ),
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
                      dateController.text = date.toString().substring(0, 10);
                    },
                    controller: dateController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        suffixIcon: Icon(
                          Icons.date_range_rounded,
                          color: kGreyTextColor,
                        ),
                        labelText: 'Joining Date',
                        hintText: '11/09/2021'),
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
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              labelText: 'Expense Purpose',
                              labelStyle: kTextStyle,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0))),
                          child:
                              DropdownButtonHideUnderline(child: getPurpose()),
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  AppTextField(
                    controller: expenseController,
                    textFieldType: TextFieldType.PHONE,
                    decoration: const InputDecoration(
                      labelText: 'Expense Amount',
                      hintText: '\$223',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  ButtonGlobal(
                    buttontext: 'Save',
                    buttonDecoration:
                        kButtonDecoration.copyWith(color: kMainColor),
                    onPressed: () {
                      _submitForm();
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
