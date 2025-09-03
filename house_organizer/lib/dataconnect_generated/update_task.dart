part of 'example.dart';

class UpdateTaskVariablesBuilder {
  String id;
  Optional<String> _title = Optional.optional(nativeFromJson, nativeToJson);
  Optional<String> _description = Optional.optional(nativeFromJson, nativeToJson);
  Optional<String> _status = Optional.optional(nativeFromJson, nativeToJson);

  final FirebaseDataConnect _dataConnect;  UpdateTaskVariablesBuilder title(String? t) {
   _title.value = t;
   return this;
  }
  UpdateTaskVariablesBuilder description(String? t) {
   _description.value = t;
   return this;
  }
  UpdateTaskVariablesBuilder status(String? t) {
   _status.value = t;
   return this;
  }

  UpdateTaskVariablesBuilder(this._dataConnect, {required  this.id,});
  Deserializer<UpdateTaskData> dataDeserializer = (dynamic json)  => UpdateTaskData.fromJson(jsonDecode(json));
  Serializer<UpdateTaskVariables> varsSerializer = (UpdateTaskVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<UpdateTaskData, UpdateTaskVariables>> execute() {
    return ref().execute();
  }

  MutationRef<UpdateTaskData, UpdateTaskVariables> ref() {
    UpdateTaskVariables vars= UpdateTaskVariables(id: id,title: _title,description: _description,status: _status,);
    return _dataConnect.mutation("UpdateTask", dataDeserializer, varsSerializer, vars);
  }
}

class UpdateTaskTaskUpdate {
  String id;
  UpdateTaskTaskUpdate.fromJson(dynamic json):
  
  id = nativeFromJson<String>(json['id']);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    return json;
  }

  UpdateTaskTaskUpdate({
    required this.id,
  });
}

class UpdateTaskData {
  UpdateTaskTaskUpdate? task_update;
  UpdateTaskData.fromJson(dynamic json):
  
  task_update = json['task_update'] == null ? null : UpdateTaskTaskUpdate.fromJson(json['task_update']);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    if (task_update != null) {
      json['task_update'] = task_update!.toJson();
    }
    return json;
  }

  UpdateTaskData({
    this.task_update,
  });
}

class UpdateTaskVariables {
  String id;
  late Optional<String>title;
  late Optional<String>description;
  late Optional<String>status;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  UpdateTaskVariables.fromJson(Map<String, dynamic> json):
  
  id = nativeFromJson<String>(json['id']) {
  
  
  
    title = Optional.optional(nativeFromJson, nativeToJson);
    title.value = json['title'] == null ? null : nativeFromJson<String>(json['title']);
  
  
    description = Optional.optional(nativeFromJson, nativeToJson);
    description.value = json['description'] == null ? null : nativeFromJson<String>(json['description']);
  
  
    status = Optional.optional(nativeFromJson, nativeToJson);
    status.value = json['status'] == null ? null : nativeFromJson<String>(json['status']);
  
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    if(title.state == OptionalState.set) {
      json['title'] = title.toJson();
    }
    if(description.state == OptionalState.set) {
      json['description'] = description.toJson();
    }
    if(status.state == OptionalState.set) {
      json['status'] = status.toJson();
    }
    return json;
  }

  UpdateTaskVariables({
    required this.id,
    required this.title,
    required this.description,
    required this.status,
  });
}

