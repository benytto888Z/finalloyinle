class ApiResponse {
  final String message;
  final int statusCode;

  const ApiResponse({
    required this.message,
    required this.statusCode,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) => ApiResponse(
    message: json['message'],
    statusCode: json['statusCode'],
  );

  Map<String, dynamic> toJson() => {
    'message': message,
    'statusCode': statusCode,
  };



  // named constructor
 /* Score.fromJson(Map<String, dynamic> json)
      : nb = json['nb']
      : hasScored = json['hasScored'];
  // method
  Map<String, dynamic> toJson() {
    return {
      'nb': nb,
      'hasScored': hasScored,
    };
  }*/

}