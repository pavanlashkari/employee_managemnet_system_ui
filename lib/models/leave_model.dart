class LeaveModel {
   String? uid;
  final String reason;
  final String fromDate;
  final String toDate;
  final String leaveDay;
  final String status;

  LeaveModel(
      {
        this.uid,
      required this.reason,
      required this.fromDate,
      required this.toDate,
      required this.leaveDay,
      required this.status});

  Map<String, dynamic> toMap() {
    return {
      'reason': reason,
      'fromDate': fromDate,
      'toDate': toDate,
      'leaveDay': leaveDay,
      'status': status,
    };
  }

  factory LeaveModel.fromMap(Map<String, dynamic> map) {
    return LeaveModel(
    uid: map['uid'] as String,
      status: map['status'] as String,
      reason: map['reason'] as String,
      fromDate: map['fromDate'] as String,
      toDate: map['toDate'] as String,
      leaveDay: map['leaveDay'] as String,
    );
  }
}
