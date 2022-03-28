import 'dart:convert';

import '../../../core/core.dart';

class CertificateModel {
  final int? id;
  final String? title;
  final String? description;
  final DateTime? receivedDate;
  final DateTime? expirationDate;

  CertificateModel({
    this.id,
    this.title,
    this.description,
    this.receivedDate,
    this.expirationDate,
  });
  String? get receivedDateFormat => dateFormatDashYYYYMMDD(date: receivedDate);
  String? get expirationDateFormat =>
      dateFormatDashYYYYMMDD(date: expirationDate);

  factory CertificateModel.fromRawJson(String str) => CertificateModel.fromJson(
        json.decode(str) as Map<String, dynamic>,
      );

  String toRawJson() => json.encode(toJson());

  factory CertificateModel.fromJson(Map<String, dynamic> json) =>
      CertificateModel(
        id: json['id'] as int?,
        title: json['title'] as String?,
        description: json['description'] as String?,
        receivedDate: json['received_date'] == null
            ? null
            : DateTime.parse(json['received_date'].toString()),
        expirationDate: json['expiration_date'] == null
            ? null
            : DateTime.parse(json['expiration_date'].toString()),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'received_date': receivedDate == null
            ? null
            : "${receivedDate!.year.toString().padLeft(4, '0')}-${receivedDate!.month.toString().padLeft(2, '0')}-${receivedDate!.day.toString().padLeft(2, '0')}",
        'expiration_date': expirationDate == null
            ? null
            : "${expirationDate!.year.toString().padLeft(4, '0')}-${expirationDate!.month.toString().padLeft(2, '0')}-${expirationDate!.day.toString().padLeft(2, '0')}",
      }..removeWhere((_, v) => v == null);

  @override
  String toString() {
    return '''
    CertificateModel(
      id: $id,
      title: $title,
      description: $description,
      receivedDate: $receivedDate,
      expirationDate: $expirationDate,
    )''';
  }
}
