import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:maan_hrm/models/attendance_model.dart';
import 'package:maan_hrm/services/database_services.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../constant.dart';

class AttendanceManagement extends StatefulWidget {
  const AttendanceManagement({Key? key}) : super(key: key);

  @override
  _AttendanceManagementState createState() => _AttendanceManagementState();
}

class _AttendanceManagementState extends State<AttendanceManagement> {
  final db = DatabaseService();

  void _acceptStatus(String uid) async {
    try {
      await FirebaseFirestore.instance
          .collection('attendances')
          .doc(uid)
          .update({'status': 'accepted'});
    } catch (e) {
      print('Error accepting status: $e');
    }
  }
  void _rejectStatus(String uid) async {
    try {
      await FirebaseFirestore.instance
          .collection('attendances')
          .doc(uid)
          .update({'status': 'rejected'});
    } catch (e) {
      print('Error rejecting status: $e');
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
          'Employee Attend List',
          maxLines: 2,
          style: kTextStyle.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: const [
          Image(
            image: AssetImage('images/employeesearch.png'),
          ),
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
                  Column(children: [
                    Container(
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.white,
                      ),
                      child: FutureBuilder<List<AttendanceModel>>(
                        future: db.fetchAllAttendance(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                                child: CircularProgressIndicator());
                          }
                          if (snapshot.hasError) {
                            return Center(
                                child: Text('Error: ${snapshot.error}'));
                          }
                          final data = snapshot.data;

                          if (data == null || data.isEmpty) {
                            return Center(
                              child: Text('No leave requests found.'),
                            );
                          }
                          return ListView.builder(
                            shrinkWrap: true,
                            itemCount: data.length,
                            itemBuilder: (context, index) {
                              final attendanceData = data[index];
                              final isPending = attendanceData.status == 'pending';
                              final isAccepted = attendanceData.status == 'accepted';
                              final isRejected = attendanceData.status == 'rejected';
                              print(attendanceData);
                              return Column(
                                children: [
                                  ListTile(
                                    onTap: () {},
                                    leading: Image.asset('images/emp1.png'),
                                    title: Text(
                                      attendanceData.employeeName,
                                      style: kTextStyle,
                                    ),
                                    subtitle: Text(
                                      attendanceData.attendanceType,
                                      style: kTextStyle.copyWith(
                                        color: kGreyTextColor,
                                      ),
                                    ),
                                    trailing: Container(
                                      height: 50.0,
                                      width: 80.0,
                                      padding: const EdgeInsets.all(10.0),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(2.0),
                                        color: kMainColor.withOpacity(0.08),
                                      ),
                                      child: Center(
                                        child: Text(
                                          attendanceData.attendanceType ==
                                                  'Present'
                                              ? 'P'
                                              : attendanceData.attendanceType ==
                                                      'Absent'
                                                  ? 'A'
                                                  : attendanceData
                                                              .attendanceType ==
                                                          'HalfDay'
                                                      ? 'HD'
                                                      : 'H',
                                          style: kTextStyle.copyWith(
                                            color: kMainColor,
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 20.0),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              'Date',
                                              style: kTextStyle.copyWith(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Text(
                                              'In Time',
                                              style: kTextStyle.copyWith(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Text(
                                              'Out Time',
                                              style: kTextStyle.copyWith(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Divider(
                                        thickness: 1.0,
                                        color: kGreyTextColor,
                                      ),
                                      const SizedBox(height: 20.0),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              attendanceData.attendanceDate,
                                              style: kTextStyle.copyWith(
                                                color: kGreyTextColor,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Text(
                                              attendanceData.inTime
                                                  .format(context)
                                                  .toString(),
                                              style: kTextStyle.copyWith(
                                                color: kGreyTextColor,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Text(
                                              attendanceData.outTime
                                                  .format(context)
                                                  .toString(),
                                              style: kTextStyle.copyWith(
                                                color: kGreyTextColor,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 20.0),
                                  Text(attendanceData.status),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      if (isPending)
                                        ElevatedButton(
                                          onPressed: () {
                                            _acceptStatus(attendanceData.docID!);
                                            setState(() {
                                            });
                                          },
                                          child: const Text('Accept'),
                                        ),
                                      const SizedBox(width: 10.0),
                                      if (isPending)
                                        ElevatedButton(
                                          onPressed: () {

                                            _rejectStatus(attendanceData.docID!);
                                            setState(() {

                                            });
                                          },
                                          child: const Text('Reject'),
                                        ),
                                      if (isAccepted)
                                        ElevatedButton(
                                          onPressed: () {
                                            _rejectStatus(attendanceData.docID!);
                                            setState(() {

                                            });
                                          },
                                          child: const Text('Reject'),
                                        ),
                                      if (isRejected)
                                        ElevatedButton(
                                          onPressed: () {
                                            _acceptStatus(attendanceData.docID!);
                                            setState(() {

                                            });
                                          },
                                          child: const Text('Accept'),
                                        ),
                                    ],
                                  ),
SizedBox(height: 30,),
                                ],
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
