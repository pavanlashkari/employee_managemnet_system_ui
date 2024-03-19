import 'package:flutter/material.dart';
import 'package:maan_hrm/GlobalComponents/button_global.dart';
import 'package:maan_hrm/Screens/Payment%20Management/add_new_card.dart';
import 'package:maan_hrm/Screens/Payment%20Management/payment_screen.dart';
import 'package:nb_utils/nb_utils.dart';
import '../../constant.dart';

// ignore_for_file: library_private_types_in_public_api
class PaymentMethods extends StatefulWidget {
  const PaymentMethods({Key? key}) : super(key: key);

  @override
  _PaymentMethodsState createState() => _PaymentMethodsState();
}

class _PaymentMethodsState extends State<PaymentMethods> {
  List<String> cardData = ["Debit Card", "Credit Card"];
  List<String> data = ["Debit Card", "Credit Card", "Paypal", "ATM Banking", "City Bank"];
  List<String> userChecked = [];
  List<String> cardIcons = [
    'images/debitcard.png',
    'images/creditcard.png',
  ];
  List<String> icons = [
    'images/debitcard.png',
    'images/creditcard.png',
    'images/paypal.png',
    'images/citybank.png',
    'images/bank.png',
  ];

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
          'Payment Methods',
          maxLines: 2,
          style: kTextStyle.copyWith(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
        ),
        actions: [
          const Image(
            image: AssetImage('images/addnewcard.png'),
          ).onTap(() {
            const AddNewCard().launch(context);
          }),
        ],
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
                borderRadius: BorderRadius.only(topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0)),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 20.0,
                  ),
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
                            secondary: Image.asset(icons[i]),
                            value: userChecked.contains(data[i]),
                            onChanged: (val) {
                              _onSelected(val!, data[i]);
                            },
                          ),
                        ),
                      );
                    },
                  ),
                  const Spacer(),
                  ButtonGlobal(
                    buttontext: 'Next',
                    buttonDecoration: kButtonDecoration.copyWith(color: kMainColor),
                    onPressed: () {
                      const PaymentScreen().launch(context);
                    },
                  ),
                  const SizedBox(
                    height: 100.0,
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
