import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:maan_hrm/models/leave_model.dart';

import '../../services/database_services.dart';

class LeaveManagement extends StatefulWidget {
  const LeaveManagement({Key? key}) : super(key: key);

  @override
  _LeaveManagementState createState() => _LeaveManagementState();
}

class _LeaveManagementState extends State<LeaveManagement> {
  bool isApproved = false;
  final db = DatabaseService();

  void _acceptStatus(String uid) async {
    try {
      await FirebaseFirestore.instance
          .collection('leaveRequest')
          .doc(uid)
          .update({'status': 'accepted'});
    } catch (e) {
      print('Error accepting status: $e');
    }
  }
  void _rejectStatus(String uid) async {
    try {
      await FirebaseFirestore.instance
          .collection('leaveRequest')
          .doc(uid)
          .update({'status': 'rejected'});
    } catch (e) {
      print('Error rejecting status: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('leave management'),),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FutureBuilder<List<LeaveModel>>(
              future: db.getLeaveRequests(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text('Error: ${snapshot.error}'),
                  );
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                final leaveRequests = snapshot.data;

                if (leaveRequests == null || leaveRequests.isEmpty) {
                  return Center(
                    child: Text('No leave requests found.'),
                  );
                }
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: leaveRequests.length,
                  itemBuilder: (context, index) {
                    final leaveModel = leaveRequests[index];
                      final isPending = leaveModel.status == 'pending';
                      final isAccepted = leaveModel.status == 'accepted';
                      final isRejected = leaveModel.status == 'rejected';

                    return Container(
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          ListTile(
                            leading: Image.asset('images/emp1.png'),
                            title: Text(
                              ' ',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                              ),
                            ),
                            trailing: Container(
                              padding: const EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2.0),
                                color: Colors.blue.withOpacity(0.1),
                              ),
                              child: Text(
                                'Status: ${leaveModel.status}',
                                style: const TextStyle(
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                'From Date: ${leaveModel.fromDate}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'To Date: ${leaveModel.toDate}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Leave Day: ${leaveModel.leaveDay}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              if (isPending)
                                ElevatedButton(
                                  onPressed: () {
                                    print(leaveModel.uid);
                                    _acceptStatus(leaveModel.uid!);
                                    setState(() {
                                    });
                                  },
                                  child: const Text('Accept'),
                                ),
                              const SizedBox(width: 10.0),
                              if (isPending)
                                ElevatedButton(
                                  onPressed: () {

                                    _rejectStatus(leaveModel.uid!);
                                    setState(() {

                                    });
                                  },
                                  child: const Text('Reject'),
                                ),
                              if (isAccepted)
                                ElevatedButton(
                                  onPressed: () {
                                    _rejectStatus(leaveModel.uid!);
                                    setState(() {

                                    });
                                  },
                                  child: const Text('Reject'),
                                ),
                              if (isRejected)
                                ElevatedButton(
                                  onPressed: () {
                                    _acceptStatus(leaveModel.uid!);
                                    setState(() {

                                    });
                                  },
                                  child: const Text('Accept'),
                                ),
                            ],
                          ),
                          const SizedBox(height: 10.0),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
