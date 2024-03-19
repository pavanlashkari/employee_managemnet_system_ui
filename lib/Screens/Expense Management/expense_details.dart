// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:maan_hrm/GlobalComponents/button_global.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../constant.dart';

class ExpenseDetails extends StatefulWidget {
  const ExpenseDetails({Key? key}) : super(key: key);

  @override
  _ExpenseDetailsState createState() => _ExpenseDetailsState();
}

class _ExpenseDetailsState extends State<ExpenseDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kMainColor,
      appBar: AppBar(
        backgroundColor: kMainColor,
        elevation: 0.0,
        automaticallyImplyLeading: false,
        titleSpacing: 0.0,
        iconTheme: const IconThemeData(color: Colors.white),
        title: ListTile(
          leading: Image.asset('images/emp1.png'),
          title: Text(
            'Sahidul Islam',
            style: kTextStyle.copyWith(color: Colors.white),
          ),
          subtitle: Text(
            'Designer',
            style: kTextStyle.copyWith(color: Colors.white),
          ),
          trailing: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.close,
              color: Colors.white,
            ),
          ),
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
                borderRadius: BorderRadius.only(topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0)),
                color: kBgColor,
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
                            labelText: 'Created By',
                            hintText: 'MaanTheme',
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
                        child: ButtonGlobal(
                          buttontext: 'Pay Slip',
                          buttonDecoration: kButtonDecoration.copyWith(color: kMainColor),
                          onPressed: null,
                        ),
                      ),
                    ],
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
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Date',
                                style: kTextStyle.copyWith(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                'Cheque No.',
                                style: kTextStyle.copyWith(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                'Amount',
                                style: kTextStyle.copyWith(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        const Divider(
                          thickness: 1.0,
                          color: kGreyTextColor,
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                '10-06-2021',
                                style: kTextStyle.copyWith(color: kGreyTextColor),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                '665745',
                                style: kTextStyle.copyWith(color: kGreyTextColor),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                '\$1000',
                                style: kTextStyle.copyWith(color: kGreyTextColor),
                              ),
                            ),
                          ],
                        ),
                        const Divider(
                          thickness: 1.0,
                          color: kGreyTextColor,
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Total',
                                style: kTextStyle.copyWith(color: kTitleColor),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                ' ',
                                style: kTextStyle.copyWith(color: kTitleColor),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                '\$1000',
                                style: kTextStyle.copyWith(color: kTitleColor),
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
                  const Spacer(),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 60.0,
                          padding: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            color: kMainColor,
                          ),
                          child: Center(
                              child: Text(
                            'Delete',
                            style: kTextStyle.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                          )),
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
                            color: kMainColor.withOpacity(0.1),
                          ),
                          child: Center(
                              child: Text(
                            'Edit',
                            style: kTextStyle.copyWith(fontWeight: FontWeight.bold),
                          )),
                        ),
                      ),
                    ],
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
