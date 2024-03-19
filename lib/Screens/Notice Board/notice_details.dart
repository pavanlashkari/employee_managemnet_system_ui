import 'package:flutter/material.dart';
import 'package:maan_hrm/GlobalComponents/product_data.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../constant.dart';

class NoticeDetails extends StatefulWidget {
  const NoticeDetails({Key? key}) : super(key: key);
// ignore_for_file: library_private_types_in_public_api
  @override
  _NoticeDetailsState createState() => _NoticeDetailsState();
}

class _NoticeDetailsState extends State<NoticeDetails> {
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
          'View Notice',
          style: kTextStyle.copyWith(color: Colors.white),
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
                        ListTile(
                          leading: Image.asset('images/emp1.png'),
                          title: Text(
                            'Sahidul Islam',
                            style: kTextStyle,
                          ),
                          subtitle: Text(
                            'Designer',
                            style: kTextStyle.copyWith(color: kGreyTextColor),
                          ),
                          trailing: Text(
                            '19 July 2021',
                            style: kTextStyle.copyWith(color: kGreyTextColor),
                          ),
                        ),
                        Text(
                          'Holy Eid-Ul-Adha',
                          style: kTextStyle,
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          description,
                          style: kTextStyle.copyWith(color: kGreyTextColor),
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
