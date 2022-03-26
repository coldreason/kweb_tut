import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kweb/constants.dart';

class LoginModel {
  final String id;
  final String password;

  LoginModel({required this.id, required this.password});
}

class UserInfoModel {
  final String id;
  final String password;
  final String name;
  final String studentId;
  final bool isStudent;

  UserInfoModel(
      {required this.id, required this.password, required this.name, required this.studentId, required this.isStudent});
}

enum FirebaseSignUpReturns {
  Successed,
  IDExist
}

enum FirebaseLoginReturns {
  Successed,
  IDNotExist,
  PasswordIncorrect
}

class LoginReturns{
  final FirebaseLoginReturns loginReturns;
  final String id;
  final bool isStudent;
  LoginReturns({required this.loginReturns,required this.id,required this.isStudent});
}

class CourseModel {
  CourseModel({required this.professor,required this.name,required this.articleList,required this.student, required this.id});

  CourseModel.fromJson(Map<String, Object?> json)
      : this(
    professor: json[FirestoreConstants.professor]! as String,
    name: json[FirestoreConstants.name]! as String,
    articleList: List<String>.from(json[FirestoreConstants.articleList] as List),
    student: List<String>.from(json[FirestoreConstants.student] as List),
    id : json[FirestoreConstants.id]! as String
  );

  final String professor;
  final String name;
  final String id;
  final List<String> articleList;
  final List<String> student;

  Map<String, Object?> toJson() {
    return {
      FirestoreConstants.professor: professor,
      FirestoreConstants.name: name,
      FirestoreConstants.articleList: articleList,
      FirestoreConstants.student: student,
      FirestoreConstants.id : id
    };
  }
}


class ProfessorModel {
  ProfessorModel({required this.id, required this.courseIdList});

  ProfessorModel.fromJson(Map<String, Object?> json)
      : this(
    id: json[FirestoreConstants.id]! as String,
    courseIdList: List<String>.from(json[FirestoreConstants.course] as List),
  );

  final String id;
  final List<String> courseIdList;

  Map<String, Object?> toJson() {
    return {
      FirestoreConstants.id: id,
      FirestoreConstants.course: courseIdList,
    };
  }
}

class StudentModel {
  StudentModel({required this.id, required this.courseIdList});

  StudentModel.fromJson(Map<String, Object?> json)
      : this(
    id: json[FirestoreConstants.id]! as String,
    courseIdList: List<String>.from(json[FirestoreConstants.course] as List),
  );

  final String id;
  final List<String> courseIdList;

  Map<String, Object?> toJson() {
    return {
      FirestoreConstants.id: id,
      FirestoreConstants.course: courseIdList,
    };
  }
}

class ArticleModel {
  ArticleModel({required this.course,required this.name,required this.body,required this.timestamp, required this.id});

  ArticleModel.fromJson(Map<String, Object?> json)
      : this(
      course: json[FirestoreConstants.course]! as String,
      name: json[FirestoreConstants.name]! as String,
      body: json[FirestoreConstants.body] as String,
      timestamp: json[FirestoreConstants.date] as Timestamp,
      id : json[FirestoreConstants.id]! as String
  );

  final String course;
  final String name;
  final String id;
  final String body;
  final Timestamp timestamp;

  Map<String, Object?> toJson() {
    return {
      FirestoreConstants.course: course,
      FirestoreConstants.name: name,
      FirestoreConstants.date: timestamp,
      FirestoreConstants.body: body,
      FirestoreConstants.id : id
    };
  }
}