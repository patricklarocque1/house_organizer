part of 'example.dart';

class CreateTaskVariablesBuilder {
  String groupHomeId;
  String assignedToUserId;
  String title;
  String description;
  Timestamp dueDate;
  String type;
  Timestamp createdAt;

  final FirebaseDataConnect _dataConnect;
  CreateTaskVariablesBuilder(this._dataConnect, {required  this.groupHomeId,required  this.assignedToUserId,required  this.title,required  this.description,required  this.dueDate,required  this.type,required  this.createdAt,});
  Deserializer<CreateTaskData> dataDeserializer = (dynamic json)  => CreateTaskData.fromJson(jsonDecode(json));
  Serializer<CreateTaskVariables> varsSerializer = (CreateTaskVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<CreateTaskData, CreateTaskVariables>> execute() {
    return ref().execute();
  }

  MutationRef<CreateTaskData, CreateTaskVariables> ref() {
    CreateTaskVariables vars= CreateTaskVariables(groupHomeId: groupHomeId,assignedToUserId: assignedToUserId,title: title,description: description,dueDate: dueDate,type: type,createdAt: createdAt,);
    return _dataConnect.mutation("CreateTask", dataDeserializer, varsSerializer, vars);
  }
}

class CreateTaskTaskInsert {
  String id;
  CreateTaskTaskInsert.fromJson(dynamic json):
  
  id = nativeFromJson<String>(json['id']);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    return json;
  }

  CreateTaskTaskInsert({
    required this.id,
  });
}

class CreateTaskData {
  CreateTaskTaskInsert task_insert;
  CreateTaskData.fromJson(dynamic json):
  
  task_insert = CreateTaskTaskInsert.fromJson(json['task_insert']);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['task_insert'] = task_insert.toJson();
    return json;
  }

  CreateTaskData({
    required this.task_insert,
  });
}

class CreateTaskVariables {
  String groupHomeId;
  String assignedToUserId;
  String title;
  String description;
  Timestamp dueDate;
  String type;
  Timestamp createdAt;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  CreateTaskVariables.fromJson(Map<String, dynamic> json):
  
  groupHomeId = nativeFromJson<String>(json['groupHomeId']),
  assignedToUserId = nativeFromJson<String>(json['assignedToUserId']),
  title = nativeFromJson<String>(json['title']),
  description = nativeFromJson<String>(json['description']),
  dueDate = Timestamp.fromJson(json['dueDate']),
  type = nativeFromJson<String>(json['type']),
  createdAt = Timestamp.fromJson(json['createdAt']);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['groupHomeId'] = nativeToJson<String>(groupHomeId);
    json['assignedToUserId'] = nativeToJson<String>(assignedToUserId);
    json['title'] = nativeToJson<String>(title);
    json['description'] = nativeToJson<String>(description);
    json['dueDate'] = dueDate.toJson();
    json['type'] = nativeToJson<String>(type);
    json['createdAt'] = createdAt.toJson();
    return json;
  }

  CreateTaskVariables({
    required this.groupHomeId,
    required this.assignedToUserId,
    required this.title,
    required this.description,
    required this.dueDate,
    required this.type,
    required this.createdAt,
  });
}

