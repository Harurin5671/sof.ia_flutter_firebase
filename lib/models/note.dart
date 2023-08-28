import 'dart:convert';

class Note {
    String name;
    String body;

    Note({
        required this.name,
        required this.body,
    });

    factory Note.fromRawJson(String str) => Note.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Note.fromJson(Map<String, dynamic> json) => Note(
        name: json["name"],
        body: json["body"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "body": body,
    };
}
