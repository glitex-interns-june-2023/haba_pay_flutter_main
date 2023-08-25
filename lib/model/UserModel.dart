// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
	bool success;
	String message;
	Data? data;

	UserModel({
		required this.success,
		required this.message,
		this.data,
	});

	factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
		success: json["success"],
		message: json["message"],
		data: Data.fromJson(json["data"]),
	);

	Map<String, dynamic> toJson() => {
		"success": success,
		"message": message,
		"data": data?.toJson(),
	};
}

class Data {
	String id;
	String email;
	String firstName;
	String lastName;
	String username;
	String phone;
	String profileUrl;
	String role;
	bool isVerified;
	String createdAt;
	bool isActive;
	String accessToken;
	String refreshToken;

	Data({
		required this.id,
		required this.email,
		required this.firstName,
		required this.lastName,
		required this.username,
		required this.phone,
		required this.profileUrl,
		required this.role,
		required this.isVerified,
		required this.createdAt,
		required this.isActive,
		required this.accessToken,
		required this.refreshToken,
	});

	factory Data.fromJson(Map<String, dynamic> json) => Data(
		id: json["id"],
		email: json["email"],
		firstName: json["first_name"],
		lastName: json["last_name"],
		username: json["username"],
		phone: json["phone"],
		profileUrl: json["profile_url"],
		role: json["role"],
		isVerified: json["is_verified"],
		createdAt: json["created_at"],
		isActive: json["is_active"],
		accessToken: json["access_token"],
		refreshToken: json["refresh_token"],
	);

	Map<String, dynamic> toJson() => {
		"id": id,
		"email": email,
		"first_name": firstName,
		"last_name": lastName,
		"username": username,
		"phone": phone,
		"profile_url": profileUrl,
		"role": role,
		"is_verified": isVerified,
		"created_at": createdAt,
		"is_active": isActive,
		"access_token": accessToken,
		"refresh_token": refreshToken,
	};
}