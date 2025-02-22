class AppResponse {
  final dynamic data;
  final int? statusCode;
  final Map<String, String>? headers;

  AppResponse({
    this.data,
    this.statusCode,
    this.headers,
  });

  List<T> toList<T>(
    T Function(Map<String, dynamic> json) fromJson, /*{String? index}*/ {
    bool? isOtherData,
  }) {
    if (isOtherData != null && isOtherData) {
      return /*(index != null ? data[index] : */ (data["data"]["data"] as List)
          .map((e) => fromJson(e))
          .toList();
    }
    if (data["data"] != null) {
      if (data["data"] is List) {
        return (data["data"] as List).map((e) => fromJson(e)).toList();
      } else {
        return [fromJson(data["data"])];
      }
    } else {
      return [fromJson(data)];
    }
  }

  T? toFromJson<T>(T Function(Map<String, dynamic> json) fromJson) {
    return data["data"] == null
        ? null
        : data["data"] is bool
            ? null
            : fromJson(data["data"]);
  }
}
