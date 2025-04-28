// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class OnDutyModel {
  final String department;
  final String hodStatus;
  final String location;
  final String ac;
  final String student;
  final List<String> validDocuments;
  final String proctor;
  final String proctorStatus;
  final DateTime createdAt;
  final String email;
  final String name;
  final String eventName;
  final String date;
  final DateTime updatedAt;
  final String year;
  final String acStatus;
  final String details;
  final String id;
  final String hod;
  final String regNo;
  final String registeredUrl;

  OnDutyModel({
    required this.department,
    required this.hodStatus,
    required this.location,
    required this.ac,
    required this.student,
    required this.validDocuments,
    required this.proctor,
    required this.proctorStatus,
    required this.createdAt,
    required this.email,
    required this.name,
    required this.eventName,
    required this.date,
    required this.updatedAt,
    required this.year,
    required this.acStatus,
    required this.details,
    required this.id,
    required this.hod,
    required this.regNo,
    required this.registeredUrl,
  });

  /// Convert model to a map (for serialization)
  Map<String, dynamic> toMap() {
    return {
      'department': department,
      'hodStatus': hodStatus,
      'location': location,
      'Ac': ac, // Ensure field names match API response
      'student': student,
      'validDocuments': validDocuments,
      'Proctor': proctor,
      'proctorstatus': proctorStatus,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'email': email,
      'name': name,
      'eventname': eventName,
      'date': date,
      'updatedAt': updatedAt.toIso8601String(),
      'year': year,
      'AcStatus': acStatus,
      'details': details,
      'id': id,
      'Hod': hod,
      'regNo': regNo,
      'registeredUrl': registeredUrl,
    };
  }

  /// Factory constructor to create an instance from a map
  factory OnDutyModel.fromMap(Map<String, dynamic> map) {
    return OnDutyModel(
      department: map['department'] ?? '',
      hodStatus: map['HodStatus'] ?? '',
      location: map['location'] ?? '',
      ac: map['Ac'] ?? '',
      student: map['student'] ?? '',
      validDocuments: map['validDocuments'] != null
          ? List<String>.from(map['validDocuments'])
          : [],
      proctor: map['Proctor'] ?? '',
      proctorStatus: map['proctorstatus'] ?? '',
      createdAt: _parseDateTime(map['createdAt']),
      email: map['email'] ?? '',
      name: map['name'] ?? '',
      eventName: map['eventname'] ?? '',
      date: map['date'] ?? '',
      updatedAt: _parseDateTime(map['updatedAt']),
      year: map['year'] ?? '',
      acStatus: map['AcStatus'] ?? '',
      details: map['details'] ?? '',
      id: map['id'] ?? '',
      hod: map['Hod'] ?? '',
      regNo: map['regNo'] ?? '',
      registeredUrl: map['registeredUrl'] ?? '',
    );
  }

  /// Function to safely parse DateTime from different formats
  static DateTime _parseDateTime(dynamic value) {
    if (value == null) return DateTime.now();
    if (value is int) {
      return DateTime.fromMillisecondsSinceEpoch(value * 1000);
    }
    if (value is double) {
      return DateTime.fromMillisecondsSinceEpoch(value.toInt() * 1000);
    }
    if (value is String) {
      try {
        return DateTime.parse(value);
      } catch (_) {
        return DateTime.now();
      }
    }
    return DateTime.now();
  }

  /// Convert model to JSON
  String toJson() => json.encode(toMap());

  /// Create model from JSON
  factory OnDutyModel.fromJson(String source) =>
      OnDutyModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
