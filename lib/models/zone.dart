import 'dart:convert';

class Zone {
    int id;
    String zone;

    Zone({
        required this.id,
        required this.zone,
    });

    factory Zone.fromRawJson(String str) => Zone.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Zone.fromJson(Map<String, dynamic> json) => Zone(
        id: json["id"],
        zone: json["zone"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "zone": zone,
    };
}