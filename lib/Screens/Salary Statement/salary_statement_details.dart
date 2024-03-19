import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import '../../constant.dart';

// ignore_for_file: library_private_types_in_public_api
class SalaryStatementDetails extends StatefulWidget {
  const SalaryStatementDetails({Key? key}) : super(key: key);

  @override
  _SalaryStatementDetailsState createState() => _SalaryStatementDetailsState();
}

class _SalaryStatementDetailsState extends State<SalaryStatementDetails> {
  final dateController = TextEditingController();

  @override
  void dispose() {
    dateController.dispose();
    super.dispose();
  }

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
                            labelText: 'Employee Type',
                            hintText: 'Full Time',
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
                        child: AppTextField(
                          textFieldType: TextFieldType.NAME,
                          readOnly: true,
                          onTap: () async {
                            var date = await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(1900), lastDate: DateTime(2100));
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
                        const SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Sl.',
                                style: kTextStyle.copyWith(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                'Provident',
                                style: kTextStyle.copyWith(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                'Gross Sa.',
                                style: kTextStyle.copyWith(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                'Basic Sa.',
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
                          height: 10.0,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                '1',
                                style: kTextStyle.copyWith(color: kGreyTextColor),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                '\$700',
                                style: kTextStyle.copyWith(color: kGreyTextColor),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                '\$1000',
                                style: kTextStyle.copyWith(color: kGreyTextColor),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                '\$1700',
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
                                '\$700',
                                style: kTextStyle.copyWith(color: kTitleColor),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                '\$1000',
                                style: kTextStyle.copyWith(color: kTitleColor),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                '\$1700',
                                style: kTextStyle.copyWith(color: kTitleColor),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
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
