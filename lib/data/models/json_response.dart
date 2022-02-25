class JsonResponse {
  bool? success = true;
  String? message;
  dynamic data;
  int? total = 0;

  JsonResponse({
    required this.success,
    this.message,
    this.data,
    this.total = 0,
  });

  factory JsonResponse.fromJson(Map<String, dynamic> json) {
    return JsonResponse(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: json.containsKey('data') ? json['data'] : null,
      total: json['total'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        'success': success,
        'message': message,
        'data': data,
        'total': total,
      };
}
