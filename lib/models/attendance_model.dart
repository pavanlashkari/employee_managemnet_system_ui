import 'package:flutter/material.dart';

enum AttendanceStatus { approved, rejected }

class AttendanceModel {
  String? docID;
  final String uid;
  final String employeeName;
  final String attendanceType;
  final TimeOfDay inTime;
  final TimeOfDay outTime;
  final String attendanceDate;
  final String status;

  AttendanceModel({
    this.docID,
    required this.uid,
    required this.employeeName,
    required this.attendanceType,
    required this.inTime,
    required this.outTime,
    required this.attendanceDate,
    required this.status,
  });

  AttendanceModel.fromMap(Map<String, dynamic> map)
      : uid = map['uid'],
  docID = map['docID'],
        employeeName = map['employeeName'],
        attendanceType = map['attendanceType'],
        inTime = _timeFromMap(map['inTime']),
        outTime = _timeFromMap(map['outTime']),
        attendanceDate = map['attendanceDate'],
        status = map['status'];
  AttendanceModel copyWith({
    String? docId,
    String? uid,
    String? employeeName,
    String? attendanceType,
    TimeOfDay? inTime,
    TimeOfDay? outTime,
    String? attendanceDate,
    String? status,
  }) {
    return AttendanceModel(
      docID: docID??this.docID,
      uid: uid ?? this.uid,
      employeeName: employeeName ?? this.employeeName,
      attendanceType: attendanceType ?? this.attendanceType,
      inTime: inTime ?? this.inTime,
      outTime: outTime ?? this.outTime,
      attendanceDate: attendanceDate ?? this.attendanceDate,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'docID' :docID,
      'uid': uid,
      'employeeName': employeeName,
      'attendanceType': attendanceType,
      'inTime': _timeToMap(inTime),
      'outTime': _timeToMap(outTime),
      'attendanceDate': attendanceDate,
      'status': status,
    };
  }

  static TimeOfDay _timeFromMap(String? timeString) {
    if (timeString == null || timeString.isEmpty)
      return TimeOfDay(hour: 0, minute: 0);
    final parts = timeString.split(':');
    return TimeOfDay(hour: int.parse(parts[0]), minute: int.parse(parts[1]));
  }

  static String _timeToMap(TimeOfDay time) {
    return '${time.hour}:${time.minute}';
  }
}
