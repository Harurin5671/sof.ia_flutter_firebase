import 'dart:convert';

import 'package:flutter_firebase_crud/models/note.dart';

class PeopleResponse {
    String password;
    List<Note> notes;
    String username;
    String uuid;

    PeopleResponse({
        required this.password,
        required this.notes,
        required this.username,
        required this.uuid,
    });

    factory PeopleResponse.fromRawJson(String str) => PeopleResponse.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory PeopleResponse.fromJson(Map<String, dynamic> json) => PeopleResponse(
        password: json["password"],
        notes: List<Note>.from(json["notes"].map((x) => Note.fromJson(x))),
        username: json["username"],
        uuid: json["uuid"],
    );

    Map<String, dynamic> toJson() => {
        "password": password,
        "notes": List<dynamic>.from(notes.map((x) => x.toJson())),
        "username": username,
        "uuid": uuid,
    };
}