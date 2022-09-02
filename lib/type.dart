class Guestbook {
  int id;
  String name;
  String message;
  String email;

  var updatedAt;

  var createdAt;

  Guestbook({
    required this.id,
    required this.name,
    required this.message,
    required this.email,
    required this.createdAt,
    required this.updatedAt,
  });

  Guestbook.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        message = json['message'].toString(),
        email = json['email'],
        createdAt = json['created_at'],
        updatedAt = json['updated_at'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'message': message,
        'email': email,
      };
}
