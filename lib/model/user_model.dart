class User {
  final int id;
  final String firstName;
  final String lastName;
  final String username;
  final String accessToken;
  final String email;
  final String image;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.accessToken,
    required this.email,
    required this.image,
  });

  factory User.fromJson(
    Map<String, dynamic> json, {
    required String accessToken,
  }) {
    return User(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      username: json['username'],
      email: json['email'],
      image: json['image'],
      accessToken: accessToken,
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
          accessToken == other.accessToken &&
          email == other.email &&
          image == other.image;

  @override
  int get hashCode =>
      Object.hash(id, firstName, lastName, username, accessToken, email, image);

  @override
  String toString() {
    return 'User{id: $id, firstName: $firstName, lastName: $lastName, username: $username, accessToken: $accessToken, email: $email, image: $image}';
  }
}
