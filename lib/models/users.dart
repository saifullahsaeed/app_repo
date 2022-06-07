class Users {
  //firebase user model
  final String fname;
  final String lname;
  final String username;
  final String email;
  final String role = 'user';
  final String password;
  final String phone;

  Users({
    required this.fname,
    required this.lname,
    required this.username,
    required this.email,
    required this.password,
    required this.phone,
  });

  factory Users.fromJson(Map<String, dynamic> json) {
    return Users(
      fname: json['fname'],
      lname: json['lname'],
      username: json['username'],
      email: json['email'],
      password: json['password'],
      phone: json['phone'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'fname': fname,
      'lname': lname,
      'username': username,
      'email': email,
      'password': password,
      'phone': phone,
    };
  }
}
