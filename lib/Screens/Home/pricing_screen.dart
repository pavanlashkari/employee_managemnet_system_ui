// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../constant.dart';

// ignore_for_file: library_private_types_in_public_api
class PricingScreen extends StatefulWidget {
  const PricingScreen({Key? key}) : super(key: key);

  @override
  _PricingScreenState createState() => _PricingScreenState();
}

class _PricingScreenState extends State<PricingScreen> {
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
          'Premium Version',
          maxLines: 2,
          style: kTextStyle.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 50.0,
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
                        height: 50.0,
                      ),
                      Text(
                        'Do you want to use this app without limits?',
                        style: kTextStyle,
                      ),
                      Text(
                        'Buy Premium unlock all features',
                        style: kTextStyle,
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(20.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: const Color(0xFFEBE7FF),
                            ),
                            child: Column(
                              children: [
                                const Image(
                                  image: AssetImage('images/monthly.png'),
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  'Monthly',
                                  style: kTextStyle,
                                ),
                                Text(
                                  '\$175',
                                  style: kTextStyle.copyWith(fontSize: 20.0, fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(20.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: const Color(0xFFFFECF5),
                            ),
                            child: Column(
                              children: [
                                const Image(
                                  image: AssetImage('images/yearly.png'),
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  'Yearly',
                                  style: kTextStyle,
                                ),
                                Text(
                                  '\$1250',
                                  style: kTextStyle.copyWith(fontSize: 20.0, fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(top: 20.0, bottom: 20.0, left: 10.0, right: 10.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: const Color(0xFFDAF3FF),
                            ),
                            child: Column(
                              children: [
                                const Image(
                                  image: AssetImage('images/lifetime.png'),
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  'LifeTime',
                                  style: kTextStyle,
                                ),
                                Text(
                                  '\$10,000',
                                  style: kTextStyle.copyWith(fontSize: 20.0, fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Container(
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
                                  flex: 2,
                                  child: Text(
                                    'Benefits',
                                    style: kTextStyle.copyWith(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    'Free',
                                    style: kTextStyle.copyWith(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    'Premium',
                                    style: kTextStyle.copyWith(fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                            Divider(
                              thickness: 1.0,
                              color: kGreyTextColor.withOpacity(0.2),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    'Manage Employees',
                                    style: kTextStyle.copyWith(color: kGreyTextColor),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    '05',
                                    textAlign: TextAlign.center,
                                    style: kTextStyle.copyWith(color: kGreyTextColor),
                                  ),
                                ),
                                const Expanded(
                                  flex: 1,
                                  child: Icon(
                                    Icons.check,
                                    color: kGreyTextColor,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    'Backup & Restore',
                                    style: kTextStyle.copyWith(color: kGreyTextColor),
                                  ),
                                ),
                                const Expanded(
                                  flex: 1,
                                  child: Icon(
                                    FontAwesomeIcons.times,
                                    color: kGreyTextColor,
                                  ),
                                ),
                                const Expanded(
                                  flex: 1,
                                  child: Icon(
                                    Icons.check,
                                    color: kGreyTextColor,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    'Summary Report',
                                    style: kTextStyle.copyWith(color: kGreyTextColor),
                                  ),
                                ),
                                const Expanded(
                                  flex: 1,
                                  child: Icon(
                                    FontAwesomeIcons.times,
                                    color: kGreyTextColor,
                                  ),
                                ),
                                const Expanded(
                                  flex: 1,
                                  child: Icon(
                                    Icons.check,
                                    color: kGreyTextColor,
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
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Card(
              elevation: 2.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Image.asset('images/premium.png'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
