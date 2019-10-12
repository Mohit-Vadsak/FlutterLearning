import 'dart:async' show Future;
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

import 'package:simple_json/student_model.dart';

Future<String> _loadAStudentAsset() async {
  return await rootBundle.loadString('data/student.json');
}

Future loadStudent() async {
  String jsonString = await _loadAStudentAsset();
  final jsonResponse = json.decode(jsonString);
  Student student = new Student.fromJson(jsonResponse);
  debugPrint(student.studentName);
  print(student.studentId);
}
