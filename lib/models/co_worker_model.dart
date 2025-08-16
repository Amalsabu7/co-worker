

import 'dart:convert';

List<CoworkerList> albumListFromJson(String str) => List<CoworkerList>.from(json.decode(str).map((x) => CoworkerList.fromJson(x)));

String coworkerListToJson(List<CoworkerList> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CoworkerList {
  String? name;
  String? username;
  String? email;
  String? phone;


  CoworkerList({
    this.name,
    this.username,
    this.email,
    this.phone
  });

  factory CoworkerList.fromJson(Map<String, dynamic> json) => CoworkerList(
    name: json["name"]?.toString() ?? "",
    username: json["username"]?.toString() ?? "",
    email: json["email"]?.toString() ?? "",
    phone: json["phone"]?.toString() ?? ""
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "username": username,
    "email": email,
    "phone": phone
  };
}