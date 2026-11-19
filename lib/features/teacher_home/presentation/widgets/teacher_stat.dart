import 'package:flutter/material.dart';

class TeacherStatModel {
  final String title;
  final String value;
  final String growth;
  final IconData icon;
  final Color color;
  final Color backgroundColor;

  const TeacherStatModel({
    required this.title,
    required this.value,
    required this.growth,
    required this.icon,
    required this.color,
    required this.backgroundColor,
  });
}
