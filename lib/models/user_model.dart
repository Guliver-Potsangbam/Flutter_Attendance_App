// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    required this.id,
    required this.name,
    required this.department,
    required this.email,
    required this.contact,
    required this.leave,
    required this.present,
    required this.absent,
    required this.totalClasses,
  });

  final dynamic id;
  final dynamic name;
  final dynamic department;
  final dynamic email;
  final dynamic contact;
  final dynamic leave;
  final dynamic present;
  final dynamic absent;
  final dynamic totalClasses;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        name: json["name"],
        department: json["department"],
        email: json["email"],
        contact: json["contact"],
        leave: json["leave"],
        present: json["present"],
        absent: json["absent"],
        totalClasses: json["total classes"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "department": department,
        "email": email,
        "contact": contact,
        "leave": leave,
        "present": present,
        "absent": absent,
        "total classes": totalClasses,
      };
}
