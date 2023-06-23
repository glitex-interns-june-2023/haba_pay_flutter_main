import 'package:haba_pay_main/generated/json/base/json_convert_content.dart';
import 'package:haba_pay_main/model/sign_in_entity.dart';

SignInEntity $SignInEntityFromJson(Map<String, dynamic> json) {
	final SignInEntity signInEntity = SignInEntity();
	final String? accessToken = jsonConvert.convert<String>(json['access_token']);
	if (accessToken != null) {
		signInEntity.accessToken = accessToken;
	}
	final String? message = jsonConvert.convert<String>(json['message']);
	if (message != null) {
		signInEntity.message = message;
	}
	return signInEntity;
}

Map<String, dynamic> $SignInEntityToJson(SignInEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['access_token'] = entity.accessToken;
	data['message'] = entity.message;
	return data;
}