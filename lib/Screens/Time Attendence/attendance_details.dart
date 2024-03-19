import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:time_chart/time_chart.dart';

import '../../constant.dart';

class AttendanceDetails extends StatefulWidget {
  const AttendanceDetails({Key? key}) : super(key: key);

  @override
  _AttendanceDetailsState createState() => _AttendanceDetailsState();
}

class _AttendanceDetailsState extends State<AttendanceDetails> {
  final data = [
    DateTimeRange(
      start: DateTime(2021, 2, 24, 23, 15),
      end: DateTime(2021, 2, 25, 7, 30),
    ),
    DateTimeRange(
      start: DateTime(2021, 2, 22, 1, 55),
      end: DateTime(2021, 2, 22, 9, 12),
    ),
    DateTimeRange(
      start: DateTime(2021, 2, 20, 0, 25),
      end: DateTime(2021, 2, 20, 7, 34),
    ),
    DateTimeRange(
      start: DateTime(2021, 2, 17, 21, 23),
      end: DateTime(2021, 2, 18, 4, 52),
    ),
    DateTimeRange(
      start: DateTime(2021, 2, 13, 6, 32),
      end: DateTime(2021, 2, 13, 13, 12),
    ),
    DateTimeRange(
      start: DateTime(2021, 2, 1, 9, 32),
      end: DateTime(2021, 2, 1, 15, 22),
    ),
    DateTimeRange(
      start: DateTime(2021, 1, 22, 12, 10),
      end: DateTime(2021, 1, 22, 16, 20),
    ),
  ];

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
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
                color: kBgColor,
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    width: context.width(),
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              'Working Hours',
                              style: kTextStyle,
                            ),
                            const Spacer(),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Today ',
                                    style: kTextStyle.copyWith(
                                      color: kGreyTextColor,
                                    ),
                                  ),
                                  const WidgetSpan(
                                    child: Icon(
                                      Icons.date_range,
                                      color: kGreyTextColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Text(
                          '6 h 30 m',
                          style: kTextStyle.copyWith(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Today',
                          style: kTextStyle.copyWith(color: kGreyTextColor),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        TimeChart(
                          data: data,
                          chartType: ChartType.amount,
                          viewMode: ViewMode.weekly,
                          barColor: kMainColor,
                          timeChartSizeAnimationDuration: const Duration(milliseconds: 200),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    width: context.width(),
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              'Attendance',
                              style: kTextStyle,
                            ),
                            const Spacer(),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: '30 May, 2021 ',
                                    style: kTextStyle.copyWith(
                                      color: kGreyTextColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Container(
                                  padding: const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10.0, right: 20.0),
                                  decoration: BoxDecoration(
                                    border: const Border(
                                        top: BorderSide(
                                      color: kMainColor,
                                    )),
                                    color: kMainColor.withOpacity(0.1),
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '12',
                                        style: kTextStyle.copyWith(color: kMainColor, fontSize: 18.0, fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        'Present',
                                        style: kTextStyle,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Container(
                                  padding: const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10.0, right: 20.0),
                                  decoration: BoxDecoration(
                                    border: const Border(
                                        top: BorderSide(
                                      color: kAlertColor,
                                    )),
                                    color: kAlertColor.withOpacity(0.1),
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '1',
                                        style: kTextStyle.copyWith(color: kAlertColor, fontSize: 18.0, fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        'Absent',
                                        style: kTextStyle,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Container(
                                  padding: const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10.0, right: 20.0),
                                  decoration: BoxDecoration(
                                    border: const Border(
                                        top: BorderSide(
                                      color: Color(0xFF4CE364),
                                    )),
                                    color: const Color(0xFF4CE364).withOpacity(0.1),
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '2',
                                        style: kTextStyle.copyWith(color: const Color(0xFF4CE364), fontSize: 18.0, fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        'Holiday',
                                        style: kTextStyle,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Container(
                                  padding: const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10.0, right: 20.0),
                                  decoration: BoxDecoration(
                                    border: const Border(
                                        top: BorderSide(
                                      color: kHalfDay,
                                    )),
                                    color: kHalfDay.withOpacity(0.1),
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '6',
                                        style: kTextStyle.copyWith(color: kHalfDay, fontSize: 18.0, fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        'HalfDay',
                                        style: kTextStyle,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Container(
                                  padding: const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10.0, right: 15.0),
                                  decoration: BoxDecoration(
                                    border: const Border(
                                        top: BorderSide(
                                      color: Color(0xFF806DF0),
                                    )),
                                    color: const Color(0xFF806DF0).withOpacity(0.1),
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '1',
                                        style: kTextStyle.copyWith(color: const Color(0xFF806DF0), fontSize: 18.0, fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        'WeekOff',
                                        style: kTextStyle,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Container(
                                  padding: const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10.0, right: 15.0),
                                  decoration: BoxDecoration(
                                    border: const Border(
                                        top: BorderSide(
                                      color: Color(0xFF4ACDF9),
                                    )),
                                    color: const Color(0xFF4ACDF9).withOpacity(0.1),
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '3',
                                        style: kTextStyle.copyWith(color: const Color(0xFF4ACDF9), fontSize: 18.0, fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        'Leave',
                                        style: kTextStyle,
                                      ),
                                    ],
                                  ),
                                ),
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
                  Container(
                    width: context.width(),
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              'Basic Pay',
                              style: kTextStyle,
                            ),
                            const Spacer(),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: '30 May, 2021 ',
                                    style: kTextStyle.copyWith(
                                      color: kGreyTextColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    'Loan',
                                    style: kTextStyle.copyWith(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    'Extra Bonus',
                                    style: kTextStyle.copyWith(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    'Total',
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
                                    '\$0.00',
                                    style: kTextStyle.copyWith(color: kGreyTextColor),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    '\$10.00',
                                    style: kTextStyle.copyWith(color: kGreyTextColor),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    '\$20.00',
                                    style: kTextStyle.copyWith(color: kGreyTextColor),
                                  ),
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
