import 'dart:convert';

class Scholarship {
    int? id;
    String? scholarship;

    Scholarship({
        this.id,
        this.scholarship,
    });

    factory Scholarship.fromRawJson(String str) => Scholarship.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Scholarship.fromJson(Map<String, dynamic> json) => Scholarship(
        id: json["id"],
        scholarship: json["scholarship"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "scholarship": scholarship,
    };
}