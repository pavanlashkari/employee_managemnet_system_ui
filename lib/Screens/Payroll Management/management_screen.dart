// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:maan_hrm/Screens/Bonus%20Management/empty_bonus.dart';
import 'package:maan_hrm/Screens/Increment/empty_increment.dart';
import 'package:maan_hrm/Screens/Payment%20Management/payment_employee_list.dart';
import 'package:maan_hrm/Screens/Payroll%20Management/add_salary_sheet.dart';
import 'package:maan_hrm/Screens/Provident%20Fund/empty_provident_fund.dart';
import 'package:nb_utils/nb_utils.dart';
import '../../GlobalComponents/button_global.dart';
import '../../GlobalComponents/purchase_model.dart';
import '../../constant.dart';

// ignore_for_file: library_private_types_in_public_api
class PayrollManagementScreen extends StatefulWidget {
  const PayrollManagementScreen({Key? key}) : super(key: key);

  @override
  _PayrollManagementScreenState createState() => _PayrollManagementScreenState();
}

class _PayrollManagementScreenState extends State<PayrollManagementScreen> {
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
          'Payroll Management',
          maxLines: 2,
          style: kTextStyle.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
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
              padding: const EdgeInsets.all(20.0),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0)),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20.0,
                  ),
                  Material(
                    elevation: 2.0,
                    child: GestureDetector(
                      onTap: () {
                        // const EmptyEmployeeScreen().launch(context);
                      },
                      child: Container(
                        width: context.width(),
                        padding: const EdgeInsets.all(10.0),
                        decoration: const BoxDecoration(
                          border: Border(
                            left: BorderSide(
                              color: Color(0xFF7D6AEF),
                              width: 3.0,
                            ),
                          ),
                          color: Colors.white,
                        ),
                        child: ListTile(
                          onTap: () {
                            const EmptyIncrement().launch(context);
                          },
                          leading: const Image(image: AssetImage('images/increment.png')),
                          title: Text(
                            'Increment',
                            maxLines: 2,
                            style: kTextStyle.copyWith(color: kTitleColor, fontWeight: FontWeight.bold),
                          ),
                          trailing: const Icon(Icons.arrow_forward_ios),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Material(
                    elevation: 2.0,
                    child: Container(
                      width: context.width(),
                      padding: const EdgeInsets.all(10.0),
                      decoration: const BoxDecoration(
                        border: Border(
                          left: BorderSide(
                            color: Color(0xFFFD73B0),
                            width: 3.0,
                          ),
                        ),
                        color: Colors.white,
                      ),
                      child: ListTile(
                        onTap: () {
                          const PaymentEmployeeList().launch(context);
                        },
                        leading: const Image(image: AssetImage('images/payment.png')),
                        title: Text(
                          'Payment',
                          maxLines: 2,
                          style: kTextStyle.copyWith(color: kTitleColor, fontWeight: FontWeight.bold),
                        ),
                        trailing: const Icon(Icons.arrow_forward_ios),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Material(
                    elevation: 2.0,
                    child: Container(
                      width: context.width(),
                      padding: const EdgeInsets.all(10.0),
                      decoration: const BoxDecoration(
                        border: Border(
                          left: BorderSide(
                            color: Color(0xFF4CCEFA),
                            width: 3.0,
                          ),
                        ),
                        color: Colors.white,
                      ),
                      child: ListTile(
                        onTap: () {
                          const AddSalarySheet().launch(context);
                        },
                        leading: const Image(image: AssetImage('images/salarysheet.png')),
                        title: Text(
                          'Salary Sheet',
                          maxLines: 2,
                          style: kTextStyle.copyWith(color: kTitleColor, fontWeight: FontWeight.bold),
                        ),
                        trailing: const Icon(Icons.arrow_forward_ios),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Material(
                    elevation: 2.0,
                    child: Container(
                      width: context.width(),
                      padding: const EdgeInsets.all(10.0),
                      decoration: const BoxDecoration(
                        border: Border(
                          left: BorderSide(
                            color: Color(0xFFF4C000),
                            width: 3.0,
                          ),
                        ),
                        color: Colors.white,
                      ),
                      child: ListTile(
                        onTap: () {
                          const EmptyBonus().launch(context);
                        },
                        leading: const Image(image: AssetImage('images/bonus.png')),
                        title: Text(
                          'Bonus',
                          maxLines: 2,
                          style: kTextStyle.copyWith(color: kTitleColor, fontWeight: FontWeight.bold),
                        ),
                        trailing: const Icon(Icons.arrow_forward_ios),
                      ),
                    ),
                  ),
                  // const SizedBox(
                  //   height: 20.0,
                  // ),
                  // Material(
                  //   elevation: 2.0,
                  //   child: Container(
                  //     width: context.width(),
                  //     padding: const EdgeInsets.all(10.0),
                  //     decoration: const BoxDecoration(
                  //       border: Border(
                  //         left: BorderSide(
                  //           color: Color(0xFFFD73B0),
                  //           width: 3.0,
                  //         ),
                  //       ),
                  //       color: Colors.white,
                  //     ),
                  //     child: ListTile(
                  //       onTap: (){
                  //         // const AttendanceEmployeeList().launch(context);
                  //       },
                  //       leading: const Image(image: AssetImage('images/loan.png')),
                  //       title: Text(
                  //         'Loan',
                  //         maxLines: 2,
                  //         style: kTextStyle.copyWith(
                  //             color: kTitleColor,
                  //             fontWeight: FontWeight.bold),
                  //       ),
                  //       trailing: const Icon(Icons.arrow_forward_ios),
                  //     ),
                  //   ),
                  // ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Material(
                    elevation: 2.0,
                    child: Container(
                      width: context.width(),
                      padding: const EdgeInsets.all(10.0),
                      decoration: const BoxDecoration(
                        border: Border(
                          left: BorderSide(
                            color: Color(0xFF05B985),
                            width: 3.0,
                          ),
                        ),
                        color: Colors.white,
                      ),
                      child: ListTile(
                        onTap: () async{
                          bool isValid = await PurchaseModel().isActiveBuyer();
                          if(isValid){
                            const EmptyProvidentFund().launch(context);
                          } else{
                            showLicense(context: context);
                          }

                        },
                        leading: const Image(image: AssetImage('images/providentfund.png')),
                        title: Text(
                          'Provident Fund',
                          maxLines: 2,
                          style: kTextStyle.copyWith(color: kTitleColor, fontWeight: FontWeight.bold),
                        ),
                        trailing: const Icon(Icons.arrow_forward_ios),
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
