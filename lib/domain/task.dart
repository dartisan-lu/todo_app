import 'package:flutter/material.dart';
import 'package:todo_app/domain/status.dart';

class Task {
  String title;
  Status status;
  UniqueKey key;

  Task({required this.key, required this.title, required this.status});

  factory Task.newTask(title) =>
      Task(key: UniqueKey(), title: title, status: Status.created);

  factory Task.fromJson(Map<String, dynamic> json) => Task(
        key: json['key'],
        title: json['title'],
        status: json['status'],
      );

  Map<String, dynamic> toJson() => {
        'key': key,
        'title': title,
        'status': status,
      };
}