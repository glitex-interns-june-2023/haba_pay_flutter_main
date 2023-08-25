import 'package:haba_pay_main/generated/json/base/json_convert_content.dart';
import 'package:haba_pay_main/model/UserModel.dart';

UserModelEntity $UserModelEntityFromJson(Map<String, dynamic> json) {
	final UserModelEntity userModelEntity = UserModelEntity();
	final bool? success = jsonConvert.convert<bool>(json['success']);
	if (success != null) {
		userModelEntity.success = success;
	}
	final String? message = jsonConvert.convert<String>(json['message']);
	if (message != null) {
		userModelEntity.message = message;
	}
	final UserModelData? data = jsonConvert.convert<UserModelData>(json['data']);
	if (data != null) {
		userModelEntity.data = data;
	}
	return userModelEntity;
}

Map<String, dynamic> $UserModelEntityToJson(UserModelEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['success'] = entity.success;
	data['message'] = entity.message;
	data['data'] = entity.data.toJson();
	return data;
}

UserModelData $UserModelDataFromJson(Map<String, dynamic> json) {
	final UserModelData userModelData = UserModelData();
	final String? id = jsonConvert.convert<String>(json['id']);
	if (id != null) {
		userModelData.id = id;
	}
	final String? email = jsonConvert.convert<String>(json['email']);
	if (email != null) {
		userModelData.email = email;
	}
	final String? firstName = jsonConvert.convert<String>(json['first_name']);
	if (firstName != null) {
		userModelData.firstName = firstName;
	}
	final String? lastName = jsonConvert.convert<String>(json['last_name']);
	if (lastName != null) {
		userModelData.lastName = lastName;
	}
	final String? username = jsonConvert.convert<String>(json['username']);
	if (username != null) {
		userModelData.username = username;
	}
	final String? phone = jsonConvert.convert<String>(json['phone']);
	if (phone != null) {
		userModelData.phone = phone;
	}
	final String? profileUrl = jsonConvert.convert<String>(json['profile_url']);
	if (profileUrl != null) {
		userModelData.profileUrl = profileUrl;
	}
	final String? role = jsonConvert.convert<String>(json['role']);
	if (role != null) {
		userModelData.role = role;
	}
	final bool? isVerified = jsonConvert.convert<bool>(json['is_verified']);
	if (isVerified != null) {
		userModelData.isVerified = isVerified;
	}
	final String? createdAt = jsonConvert.convert<String>(json['created_at']);
	if (createdAt != null) {
		userModelData.createdAt = createdAt;
	}
	final bool? isActive = jsonConvert.convert<bool>(json['is_active']);
	if (isActive != null) {
		userModelData.isActive = isActive;
	}
	final String? accessToken = jsonConvert.convert<String>(json['access_token']);
	if (accessToken != null) {
		userModelData.accessToken = accessToken;
	}
	final String? refreshToken = jsonConvert.convert<String>(json['refresh_token']);
	if (refreshToken != null) {
		userModelData.refreshToken = refreshToken;
	}
	return userModelData;
}

Map<String, dynamic> $UserModelDataToJson(UserModelData entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['email'] = entity.email;
	data['first_name'] = entity.firstName;
	data['last_name'] = entity.lastName;
	data['username'] = entity.username;
	data['phone'] = entity.phone;
	data['profile_url'] = entity.profileUrl;
	data['role'] = entity.role;
	data['is_verified'] = entity.isVerified;
	data['created_at'] = entity.createdAt;
	data['is_active'] = entity.isActive;
	data['access_token'] = entity.accessToken;
	data['refresh_token'] = entity.refreshToken;
	return data;
}