// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserInfo _$UserInfoFromJson(dynamic json) => UserInfo(
      background: json['Background'] ?? "",
      history: (json['History'] as List<dynamic>)
          .map((e) => HistoryPinPin.fromJson(e as Map<String, dynamic>))
          .toList(),
      image: json['Image'] as String,
      masterIntroduction: json['MasterIntroduction'] ?? "",
      myTags:
          (json['MyTags'] as List<dynamic>).map((e) => e as String).toList() ?? [],
      username: json['Username'] ?? "",
    )
      ..token = json['token'] as String?
      ..id = json['id'] as int?;

Map<String, dynamic> _$UserInfoToJson(UserInfo instance) => <String, dynamic>{
      'Background': instance.background,
      'History': instance.history.map((e) => e.toJson()).toList(),
      'Image': instance.image,
      'MasterIntroduction': instance.masterIntroduction,
      'MyTags': instance.myTags,
      'Username': instance.username,
      'token': instance.token,
      'id': instance.id,
    };
