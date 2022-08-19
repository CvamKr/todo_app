// To parse this JSON data, do
//
//     final todoModel = todoModelFromJson(jsonString);

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

String todoModelToJson(TodoModel data) => json.encode(data.toJson());

class TodoModel {
  TodoModel(
      {this.id = "",
      this.taskTitle = "",
      this.description = "",
      this.deadline,
      this.postedBy = "",
      this.createdOn});
  String id;
  String taskTitle;
  String description;
  DateTime? deadline;
  String postedBy;
  DateTime? createdOn;

  TodoModel copyWith({
    String? id,
    String? taskTitle,
    String? description,
    DateTime? deadline,
    String? postedBy,
  }) =>
      TodoModel(
        id: id ?? this.id,
        taskTitle: taskTitle ?? this.taskTitle,
        description: description ?? this.description,
        deadline: deadline ?? this.deadline,
        postedBy: postedBy ?? this.postedBy,
      );

  factory TodoModel.fromJson(Map<String, dynamic> json, DocumentSnapshot doc) =>
      TodoModel(
        id: doc.id,
        taskTitle: json["taskTitle"],
        description: json["description"],
        deadline: json["deadline"] == null ? null : (json["deadline"]).toDate(),
        postedBy: json["postedBy"],
        createdOn:
            json["createdOn"] == null ? null : (json["createdOn"]).toDate(),
      );

  Map<String, dynamic> toJson() => {
        "taskTitle": taskTitle,
        "description": description,
        "deadline": deadline,
        "postedBy": postedBy,
        "createdOn": createdOn,
      };
}
