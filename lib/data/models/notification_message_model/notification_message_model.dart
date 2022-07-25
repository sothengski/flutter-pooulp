import 'dart:convert';

class NotificationMessageModel {
  final int? id;
  final String? title;
  final String? body;
  final int? type;
  final int? status;
  final String? statusName;
  final int? target;
  final DateTime? startDate;
  final DateTime? endDate;

  NotificationMessageModel({
    this.id,
    this.title,
    this.body,
    this.type,
    this.status,
    this.statusName,
    this.target,
    this.startDate,
    this.endDate,
  });

  factory NotificationMessageModel.fromRawJson(String str) =>
      NotificationMessageModel.fromJson(
        json.decode(str) as Map<String, dynamic>,
      );

  String toRawJson() => json.encode(toJson());

  factory NotificationMessageModel.fromJson(Map<String, dynamic> json) =>
      NotificationMessageModel(
        id: json['id'] as int,
        title: json['title'] as String,
        body: json['body'] as String,
        type: json['type'] as int,
        status: json['status'] as int,
        statusName: json['status_name'] as String,
        target: json['target'] as int,
        startDate: json['start_date'] != null
            ? DateTime.parse(
                json['start_date'].toString(),
              )
            : null,
        endDate: json['end_date'] != null
            ? DateTime.parse(
                json['end_date'].toString(),
              )
            : null,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'body': body,
        'type': type,
        'status': status,
        'status_name': statusName,
        'target': target,
        'start_date':
            "${startDate!.year.toString().padLeft(4, '0')}-${startDate!.month.toString().padLeft(2, '0')}-${startDate!.day.toString().padLeft(2, '0')}",
        'end_date': endDate?.toIso8601String(),
      };

  @override
  String toString() => '''
    NotificationMessageModel(
      id: $id, 
      title: $title, 
      body: $body, 
      type: $type, 
      status: $status, 
      statusName: $statusName, 
      target: $target, 
      startDate: $startDate, 
      endDate: $endDate,
    )''';
}
