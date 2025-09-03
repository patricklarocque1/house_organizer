part of 'example.dart';

class UpdateUserGroupHomeVariablesBuilder {
  String id;
  String groupHomeId;

  final FirebaseDataConnect _dataConnect;
  UpdateUserGroupHomeVariablesBuilder(this._dataConnect, {required  this.id,required  this.groupHomeId,});
  Deserializer<UpdateUserGroupHomeData> dataDeserializer = (dynamic json)  => UpdateUserGroupHomeData.fromJson(jsonDecode(json));
  Serializer<UpdateUserGroupHomeVariables> varsSerializer = (UpdateUserGroupHomeVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<UpdateUserGroupHomeData, UpdateUserGroupHomeVariables>> execute() {
    return ref().execute();
  }

  MutationRef<UpdateUserGroupHomeData, UpdateUserGroupHomeVariables> ref() {
    UpdateUserGroupHomeVariables vars= UpdateUserGroupHomeVariables(id: id,groupHomeId: groupHomeId,);
    return _dataConnect.mutation("UpdateUserGroupHome", dataDeserializer, varsSerializer, vars);
  }
}

class UpdateUserGroupHomeUserUpdate {
  String id;
  UpdateUserGroupHomeUserUpdate.fromJson(dynamic json):
  
  id = nativeFromJson<String>(json['id']);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    return json;
  }

  UpdateUserGroupHomeUserUpdate({
    required this.id,
  });
}

class UpdateUserGroupHomeData {
  UpdateUserGroupHomeUserUpdate? user_update;
  UpdateUserGroupHomeData.fromJson(dynamic json):
  
  user_update = json['user_update'] == null ? null : UpdateUserGroupHomeUserUpdate.fromJson(json['user_update']);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    if (user_update != null) {
      json['user_update'] = user_update!.toJson();
    }
    return json;
  }

  UpdateUserGroupHomeData({
    this.user_update,
  });
}

class UpdateUserGroupHomeVariables {
  String id;
  String groupHomeId;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  UpdateUserGroupHomeVariables.fromJson(Map<String, dynamic> json):
  
  id = nativeFromJson<String>(json['id']),
  groupHomeId = nativeFromJson<String>(json['groupHomeId']);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    json['groupHomeId'] = nativeToJson<String>(groupHomeId);
    return json;
  }

  UpdateUserGroupHomeVariables({
    required this.id,
    required this.groupHomeId,
  });
}

