// ignore_for_file: deprecated_member_use

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:maan_hrm/Screens/Authentication/profile_screen.dart';
import 'package:maan_hrm/Screens/Authentication/select_type.dart';
import 'package:maan_hrm/Screens/Client%20Management/empty_client_list.dart';
import 'package:maan_hrm/Screens/Employee%20management/management_screen.dart';
import 'package:maan_hrm/Screens/Expense%20Management/management_screen.dart';
import 'package:maan_hrm/Screens/File%20Management/empty_file_management.dart';
import 'package:maan_hrm/Screens/Holiday%20Management/empty_holiday.dart';
import 'package:maan_hrm/Screens/Home/pricing_screen.dart';
import 'package:maan_hrm/Screens/Home/privacy_policy.dart';
import 'package:maan_hrm/Screens/Home/terms_of_service.dart';
import 'package:maan_hrm/Screens/NOC%20Certificate/empty_certificate.dart';
import 'package:maan_hrm/Screens/Notice%20Board/empty_notice_board.dart';
import 'package:maan_hrm/Screens/Payroll%20Management/management_screen.dart';
import 'package:maan_hrm/Screens/Settings/settings_screen.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:share_plus/share_plus.dart';

import '../../constant.dart';

// ignore_for_file: library_private_types_in_public_api
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isChecked = false;
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
          'HRM & Payroll Management',
          maxLines: 2,
          style: kTextStyle.copyWith(color: Colors.white, fontSize: 16.0),
        ),
        actions: const [
          Image(
            image: AssetImage('images/notificationicon.png'),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            Container(
              height: context.height() / 3,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30.0), bottomRight: Radius.circular(30.0)),
                color: kMainColor,
              ),
              child: Column(
                children: [
                  Container(
                    height: context.height() / 4,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30.0), bottomRight: Radius.circular(30.0)),
                      color: Colors.white,
                    ),
                    child: Center(
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 10.0,
                          ),
                          const CircleAvatar(
                            radius: 60.0,
                            backgroundColor: kMainColor,
                            backgroundImage: AssetImage(
                              'images/emp1.png',
                            ),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            'Sahidul Islam',
                            style: kTextStyle.copyWith(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Admin',
                            style: kTextStyle.copyWith(color: kGreyTextColor),
                          ),
                        ],
                      ).onTap(() {
                        const ProfileScreen().launch(context);
                      }),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Text(
                            '27',
                            style: kTextStyle.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Employees',
                            style: kTextStyle.copyWith(color: Colors.white),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            '12',
                            style: kTextStyle.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Client',
                            style: kTextStyle.copyWith(color: Colors.white),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            '50',
                            style: kTextStyle.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Total Files',
                            style: kTextStyle.copyWith(color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            ListTile(
              onTap: () {
                const SettingScree().launch(context);
              },
              leading: const Icon(
                Icons.settings,
                color: kGreyTextColor,
              ),
              title: Text(
                'Settings',
                style: kTextStyle.copyWith(color: kGreyTextColor),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                color: kGreyTextColor,
              ),
            ),
            ListTile(
              onTap: () {
                const PricingScreen().launch(context);
              },
              leading: const Icon(
                FontAwesomeIcons.medal,
                color: kGreyTextColor,
              ),
              title: Text(
                'Premium Version   (Pro)',
                style: kTextStyle.copyWith(color: kGreyTextColor),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                color: kGreyTextColor,
              ),
            ),
            ListTile(
              onTap: () {
                const EmptyHoliday().launch(context);
              },
              leading: const Icon(
                FontAwesomeIcons.coffee,
                color: kGreyTextColor,
              ),
              title: Text(
                'Holiday',
                style: kTextStyle.copyWith(color: kGreyTextColor),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                color: kGreyTextColor,
              ),
            ),
            ListTile(
              onTap: () {
                const EmptyHoliday().launch(context);
              },
              leading: const Icon(
                FontAwesomeIcons.lock,
                color: kGreyTextColor,
              ),
              title: Text(
                'App Lock',
                style: kTextStyle.copyWith(color: kGreyTextColor),
              ),
              trailing: Transform.scale(
                scale: 0.6,
                child: CupertinoSwitch(
                  value: isChecked,
                  thumbColor: kGreyTextColor,
                  onChanged: (bool value) {
                    setState(() {
                      isChecked = value;
                    });
                  },
                ),
              ),
            ),
            ListTile(
              onTap: () {
                setState(() {
                  Share.share('check out This Awesome HRM');
                });
              },
              leading: const Icon(
                FontAwesomeIcons.userFriends,
                color: kGreyTextColor,
              ),
              title: Text(
                'Share With Friends',
                style: kTextStyle.copyWith(color: kGreyTextColor),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                color: kGreyTextColor,
              ),
            ),
            ListTile(
              onTap: () {
                const TermsOfServices().launch(context);
              },
              leading: const Icon(
                FontAwesomeIcons.infoCircle,
                color: kGreyTextColor,
              ),
              title: Text(
                'Terms of Services',
                style: kTextStyle.copyWith(color: kGreyTextColor),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                color: kGreyTextColor,
              ),
            ),
            ListTile(
              onTap: () {
                const PrivacyPolicy().launch(context);
              },
              leading: const Icon(
                Icons.dangerous_sharp,
                color: kGreyTextColor,
              ),
              title: Text(
                'Privacy Policy',
                style: kTextStyle.copyWith(color: kGreyTextColor),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                color: kGreyTextColor,
              ),
            ),
            ListTile(
              onTap: () {
                FirebaseAuth.instance.signOut();
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SelectType(),
                    ));
              },
              leading: const Icon(
                FontAwesomeIcons.signOutAlt,
                color: kGreyTextColor,
              ),
              title: Text(
                'Logout',
                style: kTextStyle.copyWith(color: kGreyTextColor),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                color: kGreyTextColor,
              ),
            ),
          ],
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
                borderRadius: BorderRadius.only(topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0)),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Material(
                          elevation: 2.0,
                          child: GestureDetector(
                            onTap: () {
                              const EmployeeManagement().launch(context);
                            },
                            child: Container(
                              width: context.width(),
                              padding: const EdgeInsets.all(10.0),
                              decoration: const BoxDecoration(
                                border: Border(
                                  left: BorderSide(
                                    color: Color(0xFF7C69EE),
                                    width: 3.0,
                                  ),
                                ),
                                color: Colors.white,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Image(image: AssetImage('images/employeemanagement.png')),
                                  Text(
                                    'Employee Management',
                                    style: kTextStyle.copyWith(color: kTitleColor, fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20.0,
                      ),
                      Expanded(
                        child: Material(
                          elevation: 2.0,
                          child: GestureDetector(
                            onTap: () {
                              const ExpenseManagementScreen().launch(context);
                            },
                            child: Container(
                              width: context.width(),
                              padding: const EdgeInsets.all(10.0),
                              decoration: const BoxDecoration(
                                border: Border(
                                  left: BorderSide(
                                    color: Color(0xFFFD72AF),
                                    width: 3.0,
                                  ),
                                ),
                                color: Colors.white,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Image(image: AssetImage('images/expensemanagement.png')),
                                  Text(
                                    'Expense Management',
                                    style: kTextStyle.copyWith(color: kTitleColor, fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Material(
                          elevation: 2.0,
                          child: GestureDetector(
                            onTap: () {
                              const PayrollManagementScreen().launch(context);
                            },
                            child: Container(
                              width: context.width(),
                              padding: const EdgeInsets.all(10.0),
                              decoration: const BoxDecoration(
                                border: Border(
                                  left: BorderSide(
                                    color: Color(0xFF4ACDF9),
                                    width: 3.0,
                                  ),
                                ),
                                color: Colors.white,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Image(image: AssetImage('images/payrollmanagement.png')),
                                  Text(
                                    'Payroll Management',
                                    style: kTextStyle.copyWith(color: kTitleColor, fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20.0,
                      ),
                      Expanded(
                        child: Material(
                          elevation: 2.0,
                          child: GestureDetector(
                            onTap: () {
                              const EmptyFileManagement().launch(context);
                            },
                            child: Container(
                              width: context.width(),
                              padding: const EdgeInsets.all(10.0),
                              decoration: const BoxDecoration(
                                border: Border(
                                  left: BorderSide(
                                    color: Color(0xFF02B984),
                                    width: 3.0,
                                  ),
                                ),
                                color: Colors.white,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Image(image: AssetImage('images/filemanagement.png')),
                                  Text(
                                    ' Files Managements ',
                                    maxLines: 2,
                                    style: kTextStyle.copyWith(color: kTitleColor, fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
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
                            color: Color(0xFF4DCEFA),
                            width: 3.0,
                          ),
                        ),
                        color: Colors.white,
                      ),
                      child: ListTile(
                        onTap: () {
                          const EmptyClientList().launch(context);
                        },
                        leading: const Image(image: AssetImage('images/clientmanagement.png')),
                        title: Text(
                          'Client Management',
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
                            color: Color(0xFFFF8919),
                            width: 3.0,
                          ),
                        ),
                        color: Colors.white,
                      ),
                      child: ListTile(
                        onTap: () {
                          const EmptyCertificate().launch(context);
                        },
                        leading: const Image(image: AssetImage('images/noccertificate.png')),
                        title: Text(
                          'NOC/Ex Certificate',
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
                            color: Color(0xFF1CC389),
                            width: 3.0,
                          ),
                        ),
                        color: Colors.white,
                      ),
                      child: ListTile(
                        onTap: () {
                          const EmptyNoticeBoard().launch(context);
                        },
                        leading: const Image(image: AssetImage('images/noticeboard.png')),
                        title: Text(
                          'Notice Board',
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
                            color: Color(0xFF8270F1),
                            width: 3.0,
                          ),
                        ),
                        color: Colors.white,
                      ),
                      child: ListTile(
                        leading: const Image(image: AssetImage('images/awards.png')),
                        title: Text(
                          'Awards',
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
          ],
        ),
      ),
    );
  }
}
