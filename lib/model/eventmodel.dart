import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class EventModel {
  final String id;
  final String eventName;
  final String registerUrl;
  final String location;
  final DateTime date;
  final DateTime updatedAt;
  final DateTime createdAt;
  final List<String> images;
  final String details;
  final DateTime expiry;
  EventModel({
    required this.id,
    required this.eventName,
    required this.registerUrl,
    required this.location,
    required this.date,
    required this.updatedAt,
    required this.createdAt,
    required this.images,
    required this.details,
    required this.expiry,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'eventName': eventName,
      'registerUrl': registerUrl,
      'location': location,
      'date': date.millisecondsSinceEpoch,
      'updatedAt': updatedAt.millisecondsSinceEpoch,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'images': images,
      'details': details,
      'expiry': expiry.millisecondsSinceEpoch,
    };
  }

 factory EventModel.fromMap(Map<String, dynamic> map) {
    return EventModel(
      id: map['id'] as String,
      eventName: map['eventname'] as String, // <-- Fix here
      registerUrl: map['registerUrl'] as String,
      location: map['location'] as String,
      date: DateTime.parse(map['date']), // API returns date as String
      updatedAt:
          DateTime.parse(map['updatedAt']), // Fix parsing for ISO strings
      createdAt: DateTime.fromMillisecondsSinceEpoch(
          map['createdAt'] * 1000), // Fix UNIX timestamp conversion
      images: List<String>.from(map['images'] ?? []), // Handle null safety
      details: map['details'] as String,
      expiry: DateTime.fromMillisecondsSinceEpoch(
          map['expiry'] * 1000), // Fix UNIX timestamp
    );
  }


  String toJson() => json.encode(toMap());

  factory EventModel.fromJson(String source) => EventModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
