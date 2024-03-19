import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_brand.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:maan_hrm/Screens/Payment%20Management/payment_method_management.dart';
import 'package:nb_utils/nb_utils.dart';
import '../../constant.dart';

// ignore_for_file: library_private_types_in_public_api
class SelectPaymentMethod extends StatefulWidget {
  const SelectPaymentMethod({Key? key}) : super(key: key);

  @override
  _SelectPaymentMethodState createState() => _SelectPaymentMethodState();
}

class _SelectPaymentMethodState extends State<SelectPaymentMethod> {
  String cardNumber = '4591 8432 3234 2123';
  String expiryDate = '11/30';
  String cardHolderName = 'Add Card';
  String cvvCode = '000';
  bool isCvvFocused = false;

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
          'Empty Increment',
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
                  CreditCardWidget(
                    textStyle: kTextStyle.copyWith(fontSize: 10.0, color: Colors.white),
                    cardNumber: cardNumber,
                    expiryDate: expiryDate,
                    cardHolderName: cardHolderName,
                    cvvCode: cvvCode,
                    showBackView: isCvvFocused,
                    obscureCardNumber: true,
                    obscureCardCvv: true,
                    isHolderNameVisible: true,
                    cardBgColor: kMainColor,
                    isSwipeGestureEnabled: true,
                    onCreditCardWidgetChange: (CreditCardBrand creditCardBrand) {},
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
                        const PaymentMethods().launch(context);
                      },
                      leading: Image.asset('images/addcard.png'),
                      title: Text(
                        'Select Your Card',
                        style: kTextStyle,
                      ),
                      subtitle: Text(
                        'Add card or bank account',
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
