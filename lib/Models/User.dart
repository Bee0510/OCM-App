// ignore_for_file: file_names, non_constant_identifier_names

class Users {
  final String uid;
  Users({required this.uid});
}

class UserData {
  final String uid;
  final String Name;
  final String Sugars;
  final int Strength;
  UserData({
    required this.Name,
    required this.Strength,
    required this.Sugars,
    required this.uid,
  });
}
