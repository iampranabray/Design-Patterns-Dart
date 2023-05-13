// To parse this JSON data, do
//
//     final upiData = upiDataFromJson(jsonString);

import 'dart:convert';

UpiData upiDataFromJson(String str) => UpiData.fromJson(json.decode(str));

String upiDataToJson(UpiData data) => json.encode(data.toJson());

class UpiData {
  final List<Upi>? upi;
  final List<Id>? id;

  UpiData({
    this.upi,
    this.id,
  });

  factory UpiData.fromJson(Map<String, dynamic> json) => UpiData(
        upi: json["UPI"] == null
            ? []
            : List<Upi>.from(json["UPI"]!.map((x) => Upi.fromJson(x))),
        id: json["ID"] == null
            ? []
            : List<Id>.from(json["ID"]!.map((x) => Id.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "UPI":
            upi == null ? [] : List<dynamic>.from(upi!.map((x) => x.toJson())),
        "ID": id == null ? [] : List<dynamic>.from(id!.map((x) => x.toJson())),
      };
}

class Id {
  final String? id;
  final String? type;

  Id({
    this.id,
    this.type,
  });

  factory Id.fromJson(Map<String, dynamic> json) => Id(
        id: json["id"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
      };
}

class Upi {
  final String? id;
  final String? bank;

  Upi({
    this.id,
    this.bank,
  });

  factory Upi.fromJson(Map<String, dynamic> json) => Upi(
        id: json["id"],
        bank: json["bank"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "bank": bank,
      };
}
