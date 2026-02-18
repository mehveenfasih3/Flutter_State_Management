import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';

class Subject {
  final String id;
  late String subject;
  late String date;
  Subject({required this.subject, required this.date}) : id = Uuid().v4();
  @override
  String toString() {
    return 'Subject: $subject, Date: $date';
  }
}

class SubjectBook extends ValueNotifier<List<Subject>> {
  SubjectBook._sharedInstance() : super([]);
  static final SubjectBook _shared = SubjectBook._sharedInstance();
  factory SubjectBook() => _shared;
  final List<Subject> subjects = [Subject(subject: "DSA", date: "2 feb 2026")];
  int get length => value.length;
  void add({required Subject subject}) {
    final subjects = value;

    subjects.add(subject);

    notifyListeners();
  }

  void remove({required Subject subject}) {
    value.remove(subject);
    notifyListeners();
  }

  Subject? subject({required int atIndex}) =>
      value.length > atIndex ? value[atIndex] : null;
}
