class User {
  final int id;
  final String firstName;
  final String lastName;
  final String username;
  final String password;
  final String email;
  final String token;
  final String profilePictureUrl;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.password,
    required this.email,
    required this.token,
    required this.profilePictureUrl,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      username: json['username'],
      password: json['password'],
      email: json['email'],
      token: json['token'],
      profilePictureUrl: json['profilePictureUrl'],
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is User &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          firstName == other.firstName &&
          lastName == other.lastName &&
          username == other.username &&
          password == other.password &&
          email == other.email &&
          token == other.token &&
          profilePictureUrl == other.profilePictureUrl;

  @override
  int get hashCode => Object.hash(
    id,
    firstName,
    lastName,
    username,
    password,
    email,
    token,
    profilePictureUrl,
  );

  @override
  String toString() {
    return 'User{id: $id, firstName: $firstName, lastName: $lastName, username: $username, password: $password, email: $email, token: $token, profilePictureUrl: $profilePictureUrl}';
  }
}
