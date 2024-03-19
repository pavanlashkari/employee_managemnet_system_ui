import 'package:flutter/material.dart';
import 'package:maan_hrm/GlobalComponents/button_global.dart';
import 'package:maan_hrm/GlobalComponents/product_data.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../constant.dart';

// ignore_for_file: library_private_types_in_public_api
class CertificateDetails extends StatefulWidget {
  const CertificateDetails({Key? key}) : super(key: key);

  @override
  _CertificateDetailsState createState() => _CertificateDetailsState();
}

class _CertificateDetailsState extends State<CertificateDetails> {
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
            'NOC',
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20.0,
            ),
            Container(
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
                              child: Column(
                                children: [
                                  Text(
                                    'Date',
                                    style: kTextStyle.copyWith(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '11/03/2021',
                                    style: kTextStyle.copyWith(color: kGreyTextColor),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: ButtonGlobal(
                                buttontext: 'Print',
                                buttonDecoration: kButtonDecoration.copyWith(color: kMainColor),
                                onPressed: null,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Text(
                          'NO OBJECTION  CERTIFICATE',
                          style: kTextStyle.copyWith(fontWeight: FontWeight.bold),
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
                            Text(
                              'Sahidul Islam',
                              style: kTextStyle.copyWith(color: kGreyTextColor),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Container(
                          width: context.width(),
                          padding: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: kBgColor,
                          ),
                          child: Center(
                            child: Text(
                              description,
                              style: kTextStyle.copyWith(color: kGreyTextColor),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          children: [
                            Column(
                              children: [
                                Text(
                                  'MaanTheme',
                                  style: kTextStyle.copyWith(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Sahidul Islam',
                                  style: kTextStyle.copyWith(color: kGreyTextColor),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.all(4.0),
                                    child: Divider(
                                      thickness: 1.0,
                                      color: kGreyTextColor,
                                    ),
                                  ),
                                  Text(
                                    'Authorised Signature',
                                    style: kTextStyle.copyWith(fontSize: 12.0, color: kGreyTextColor),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.all(4.0),
                                    child: Divider(
                                      thickness: 1.0,
                                      color: kGreyTextColor,
                                    ),
                                  ),
                                  Text(
                                    'Administrator Signature',
                                    style: kTextStyle.copyWith(fontSize: 12.0, color: kGreyTextColor),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
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
          ],
        ),
      ),
    );
  }
}
