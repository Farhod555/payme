// To parse this JSON data, do
//
//     final paymeModel = paymeModelFromJson(jsonString);

import 'package:hive/hive.dart';
import 'dart:convert';

part 'payme_model.g.dart';

List<PaymeModel> paymeModelFromJson(String str) => List<PaymeModel>.from(json.decode(str).map((x) => PaymeModel.fromJson(x)));

String paymeModelToJson(List<PaymeModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@HiveType(typeId: 1)
class PaymeModel {
  PaymeModel({
    required this.kartaraqam,
    required this.srok,
    required this.name,
    required this.id,
  });

  @HiveField(1)
  int? kartaraqam;
  @HiveField(2)
  int? srok;
  @HiveField(3)
  String? name;
  @HiveField(4)
  String? id;

  factory PaymeModel.fromJson(Map<String, dynamic> json) => PaymeModel(
    kartaraqam: json["kartaraqam"],
    srok: json["srok"],
    name: json["name"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "kartaraqam": kartaraqam,
    "srok": srok,
    "name": name,
    "id": id,
  };
}
