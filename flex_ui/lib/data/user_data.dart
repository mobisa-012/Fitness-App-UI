//Contains user data that might change with time: photo,name ,email and workout list
import 'package:firebase_auth/firebase_auth.dart';

class UserData {
  String? name;
  String? email;
  String? photo;
  List<WorkoutData>? workouts;

  UserData(
      {required this.email,
      required this.name,
      required this.photo,
      required this.workouts});

  UserData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    photo = json['photo'];
    if (json['workouts'] != null) {
      List<WorkoutData> workouts = [];
      json['workouts'].forEach((v) {
        workouts.add(WorkoutData.fromJson(v));
      });
    }
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = this.name;
    data['email'] = this.email;
    data['photo'] = this.photo;
    if (this.workouts != null) {
      data['workouts'] = this.workouts!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  static fromFirebase(User? user) {
    return user != null
        ? UserData(
            email: user.email ?? '',
            name: user.displayName ?? '',
            photo: user.photoURL ?? '',
            workouts: [],
          )
        : [];
  }
}
