// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
    UserModel({
        this.userId="",
        this.displayName="",
        this.displayPic="",
    });

    String userId;
    String displayName;
    String displayPic;

    UserModel copyWith({
        String? userId,
        String? displayName,
        String? displayPic,
    }) => 
        UserModel(
            userId: userId ?? this.userId,
            displayName: displayName ?? this.displayName,
            displayPic: displayPic ?? this.displayPic,
        );

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        userId: json["userId"],
        displayName: json["displayName"],
        displayPic: json["displayPic"],
    );

    Map<String, dynamic> toJson() => {
        "userId": userId,
        "displayName": displayName,
        "displayPic": displayPic,
    };
}
