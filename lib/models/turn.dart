import 'dart:convert';

class Turn {
    int id;
    String turn;

    Turn({
        required this.id,
        required this.turn,
    });

    factory Turn.fromRawJson(String str) => Turn.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Turn.fromJson(Map<String, dynamic> json) => Turn(
        id: json["id"],
        turn: json["turn"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "turn": turn,
    };
}