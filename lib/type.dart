class Guestbook {
  int id;
  String name;
  String message;
  String email;

  Guestbook(this.id, this.name, this.message, this.email);

  Guestbook.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        message = json['message'],
        email = json['email'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'message': message,
        'email': email,
      };
}
