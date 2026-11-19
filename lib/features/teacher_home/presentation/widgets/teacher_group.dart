import 'package:flutter/material.dart';

class TeacherGroupModel {
  final String title;
  final int studentsCount;
  final String lastSession;
  final Widget leadingWidget;

  const TeacherGroupModel({
    required this.title,
    required this.studentsCount,
    required this.lastSession,
    required this.leadingWidget,
  });
}
