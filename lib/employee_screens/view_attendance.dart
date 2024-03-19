import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:maan_hrm/models/attendance_model.dart';
import 'package:maan_hrm/services/database_services.dart';

class ViewAttendance extends StatelessWidget {
   ViewAttendance();
  final db = DatabaseService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Leave Requests'),
      ),
      body: FutureBuilder<List<AttendanceModel>>(
        future: db.fetchAttendanceFromUid(FirebaseAuth.instance.currentUser!.uid),
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

          final attendanceRequests = snapshot.data;

          if (attendanceRequests == null || attendanceRequests.isEmpty) {
            return const Center(
              child: Text('No attendance found.'),
            );
          }

          return ListView.builder(
            itemCount: attendanceRequests.length,
            itemBuilder: (context, index) {
              final attendModel = attendanceRequests[index];
              return Column(
                children: [
                  ListTile(
                    title: Text('In Time: ${attendModel.inTime.hour}:${attendModel.inTime.minute}'),
                    subtitle: Text('out Time: ${attendModel.outTime.hour}:${attendModel.outTime.minute}'),
                    trailing: Text(attendModel.attendanceDate),
                  ),
                  Text(attendModel.status),
                  const SizedBox(height: 15,),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
