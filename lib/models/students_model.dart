// To parse this JSON data, do
//
//     final studentModel = studentModelFromJson(jsonString);

import 'dart:convert';

StudentModel? studentModelFromJson(String str) =>
    StudentModel.fromJson(json.decode(str));

String studentModelToJson(StudentModel? data) => json.encode(data!.toJson());

class StudentModel {
  StudentModel({
    this.id,
    this.name,
    this.username,
    this.present,
    this.noOfPresent,
    this.imgurl,
    this.email,
    this.address,
    this.contact,
    this.course,
  });

  int? id;
  String? name;
  String? username;
  String? present;
  int? noOfPresent;
  String? imgurl;
  String? email;
  String? address;
  int? contact;
  String? course;

  factory StudentModel.fromJson(Map<String, dynamic> json) => StudentModel(
        id: json["id"],
        name: json["name"],
        username: json["username"],
        present: json["present"],
        noOfPresent: json["noOfPresent"],
        imgurl: json["imgurl"],
        email: json["email"],
        address: json["address"],
        contact: json["contact"],
        course: json["course"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "username": username,
        "present": present,
        "noOfPresent": noOfPresent,
        "imgurl": imgurl,
        "email": email,
        "address": address,
        "contact": contact,
        "course": course,
      };
}
