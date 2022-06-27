class JsonResponse {
  final bool? success;
  final int? status;
  final String? message;
  final dynamic data;
  final int? total;

  const JsonResponse({
    this.success = false,
    this.status = 0,
    this.message = '',
    this.data,
    this.total = 0,
  });

  factory JsonResponse.fromJson(Map<String, dynamic> json) {
    return JsonResponse(
      success: json['success'] as bool?,
      status: json['status'] as int?,
      message: json['message'] as String?,
      data: json.containsKey('data') ? json['data'] : null,
      total: json['total'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        'success': success,
        'status': status,
        'message': message,
        'data': data,
        'total': total,
      };

  @override
  String toString() {
    return '''
      JsonResponse(
        success: $success,
        status: $status,
        message: $message,
        data: $data,
        total: $total,
      )''';
  }
}
