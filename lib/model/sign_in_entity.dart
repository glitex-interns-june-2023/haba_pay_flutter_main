import 'package:haba_pay_main/generated/json/base/json_field.dart';
import 'package:haba_pay_main/generated/json/sign_in_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class SignInEntity {
	@JSONField(name: "access_token")
	late String accessToken;
	late String message;

	SignInEntity();

	factory SignInEntity.fromJson(Map<String, dynamic> json) => $SignInEntityFromJson(json);

	Map<String, dynamic> toJson() => $SignInEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}