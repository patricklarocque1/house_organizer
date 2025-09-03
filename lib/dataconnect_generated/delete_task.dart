part of 'example.dart';

class DeleteTaskVariablesBuilder {
  String id;

  final FirebaseDataConnect _dataConnect;
  DeleteTaskVariablesBuilder(this._dataConnect, {required  this.id,});
  Deserializer<DeleteTaskData> dataDeserializer = (dynamic json)  => DeleteTaskData.fromJson(jsonDecode(json));
  Serializer<DeleteTaskVariables> varsSerializer = (DeleteTaskVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<DeleteTaskData, DeleteTaskVariables>> execute() {
    return ref().execute();
  }

  MutationRef<DeleteTaskData, DeleteTaskVariables> ref() {
    DeleteTaskVariables vars= DeleteTaskVariables(id: id,);
    return _dataConnect.mutation("DeleteTask", dataDeserializer, varsSerializer, vars);
  }
}

class DeleteTaskTaskDelete {
  String id;
  DeleteTaskTaskDelete.fromJson(dynamic json):
  
  id = nativeFromJson<String>(json['id']);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    return json;
  }

  DeleteTaskTaskDelete({
    required this.id,
  });
}

class DeleteTaskData {
  DeleteTaskTaskDelete? task_delete;
  DeleteTaskData.fromJson(dynamic json):
  
  task_delete = json['task_delete'] == null ? null : DeleteTaskTaskDelete.fromJson(json['task_delete']);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    if (task_delete != null) {
      json['task_delete'] = task_delete!.toJson();
    }
    return json;
  }

  DeleteTaskData({
    this.task_delete,
  });
}

class DeleteTaskVariables {
  String id;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  DeleteTaskVariables.fromJson(Map<String, dynamic> json):
  
  id = nativeFromJson<String>(json['id']);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    return json;
  }

  DeleteTaskVariables({
    required this.id,
  });
}

