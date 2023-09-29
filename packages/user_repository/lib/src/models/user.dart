import 'package:equatable/equatable.dart';

class User extends Equatable {
  const User(this.id, this.email, this.username, this.name, this.birthday,
      this.horoscope, this.height, this.weight, this.interests);

  final String? id;
  final String? email;
  final String? username;
  final String? name;
  final String? birthday;
  final String? horoscope;
  final int? height;
  final int? weight;
  final List<String?> interests;

  @override
  List<Object?> get props => [
        id,
        email,
        username,
        name,
        birthday,
        horoscope,
        height,
        weight,
        interests
      ];

  static const empty = User('', '', '', '', '', '', 0, 0, []);
}
