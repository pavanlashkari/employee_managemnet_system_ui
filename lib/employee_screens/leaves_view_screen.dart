import 'package:flutter/material.dart';
import 'package:maan_hrm/models/leave_model.dart';
import 'package:maan_hrm/services/database_services.dart';

class LeaveViewScreen extends StatelessWidget {
  final db = DatabaseService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Leave Requests'),
      ),
      body: FutureBuilder<List<LeaveModel>>(
        future: db.getLeaveRequests(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
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
            itemCount: leaveRequests.length,
            itemBuilder: (context, index) {
              final leaveModel = leaveRequests[index];
              return ListTile(
                title: Text(leaveModel.reason),
                subtitle: Text('${leaveModel.fromDate} to ${leaveModel.toDate}'),
                trailing: Text(leaveModel.status),
              );
            },
          );
        },
      ),
    );
  }
}
