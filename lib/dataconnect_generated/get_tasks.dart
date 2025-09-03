part of 'example.dart';

class GetTasksVariablesBuilder {
  
  final FirebaseDataConnect _dataConnect;
  GetTasksVariablesBuilder(this._dataConnect, );
  Deserializer<GetTasksData> dataDeserializer = (dynamic json)  => GetTasksData.fromJson(jsonDecode(json));
  
  Future<QueryResult<GetTasksData, void>> execute() {
    return ref().execute();
  }

  QueryRef<GetTasksData, void> ref() {
    
    return _dataConnect.query("GetTasks", dataDeserializer, emptySerializer, null);
  }
}

class GetTasksTasks {
  String id;
  String title;
  String description;
  String status;
  String type;
  Timestamp dueDate;
  Timestamp createdAt;
  GetTasksTasks.fromJson(dynamic json):
  
  id = nativeFromJson<String>(json['id']),
  title = nativeFromJson<String>(json['title']),
  description = nativeFromJson<String>(json['description']),
  status = nativeFromJson<String>(json['status']),
  type = nativeFromJson<String>(json['type']),
  dueDate = Timestamp.fromJson(json['dueDate']),
  createdAt = Timestamp.fromJson(json['createdAt']);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    json['title'] = nativeToJson<String>(title);
    json['description'] = nativeToJson<String>(description);
    json['status'] = nativeToJson<String>(status);
    json['type'] = nativeToJson<String>(type);
    json['dueDate'] = dueDate.toJson();
    json['createdAt'] = createdAt.toJson();
    return json;
  }

  GetTasksTasks({
    required this.id,
    required this.title,
    required this.description,
    required this.status,
    required this.type,
    required this.dueDate,
    required this.createdAt,
  });
}

class GetTasksData {
  List<GetTasksTasks> tasks;
  GetTasksData.fromJson(dynamic json):
  
  tasks = (json['tasks'] as List<dynamic>)
        .map((e) => GetTasksTasks.fromJson(e))
        .toList();

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['tasks'] = tasks.map((e) => e.toJson()).toList();
    return json;
  }

  GetTasksData({
    required this.tasks,
  });
}

