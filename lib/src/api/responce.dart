
class Response<T> {
  int id;
  T result;
  Error error;

  Response.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        result = json.containsKey("result") ? json["result"] : null,
        error = json.containsKey("error") ? Error.fromJson(json["error"]) : null;
}

class Error {
  Data data;
  int code;

  Error({
    this.data,
    this.code,
  });

  factory Error.fromJson(Map<String, dynamic> json) => Error(
        data: json.containsKey("data")  ? Data.fromJson(json["data"]) : null,
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "code": code,
      };
}

class Data {
  int code;
  String name;
  String message;
  List<dynamic> stack;

  Data({
    this.code,
    this.name,
    this.message,
    this.stack,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        code: json["code"],
        name: json["name"],
        message: json["message"],
        stack: json.containsKey("stack") 
            ? List<dynamic>.from(json["stack"].map((x) => x))
            : null,
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "name": name,
        "message": message,
        "stack": List<dynamic>.from(stack.map((x) => x)),
      };
}
