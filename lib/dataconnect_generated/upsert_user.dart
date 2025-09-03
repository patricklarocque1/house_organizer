part of 'example.dart';

class UpsertUserVariablesBuilder {
  String id;
  String displayName;
  String email;
  String role;
  Timestamp createdAt;
  final Optional<String> _photoUrl =
      Optional.optional(nativeFromJson, nativeToJson);

  final FirebaseDataConnect _dataConnect;
  UpsertUserVariablesBuilder photoUrl(String? t) {
    _photoUrl.value = t;
    return this;
  }

  UpsertUserVariablesBuilder(
    this._dataConnect, {
    required this.id,
    required this.displayName,
    required this.email,
    required this.role,
    required this.createdAt,
  });
  Deserializer<UpsertUserData> dataDeserializer =
      (dynamic json) => UpsertUserData.fromJson(jsonDecode(json));
  Serializer<UpsertUserVariables> varsSerializer =
      (UpsertUserVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<UpsertUserData, UpsertUserVariables>> execute() {
    return ref().execute();
  }

  MutationRef<UpsertUserData, UpsertUserVariables> ref() {
    UpsertUserVariables vars = UpsertUserVariables(
      id: id,
      displayName: displayName,
      email: email,
      role: role,
      createdAt: createdAt,
      photoUrl: _photoUrl,
    );
    return _dataConnect.mutation(
        "UpsertUser", dataDeserializer, varsSerializer, vars);
  }
}

class UpsertUserUserUpsert {
  String id;
  UpsertUserUserUpsert.fromJson(dynamic json)
      : id = nativeFromJson<String>(json['id']);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    return json;
  }

  UpsertUserUserUpsert({
    required this.id,
  });
}

class UpsertUserData {
  UpsertUserUserUpsert user_upsert;
  UpsertUserData.fromJson(dynamic json)
      : user_upsert = UpsertUserUserUpsert.fromJson(json['user_upsert']);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['user_upsert'] = user_upsert.toJson();
    return json;
  }

  UpsertUserData({
    required this.user_upsert,
  });
}

class UpsertUserVariables {
  String id;
  String displayName;
  String email;
  String role;
  Timestamp createdAt;
  late Optional<String> photoUrl;
  @Deprecated(
      'fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  UpsertUserVariables.fromJson(Map<String, dynamic> json)
      : id = nativeFromJson<String>(json['id']),
        displayName = nativeFromJson<String>(json['displayName']),
        email = nativeFromJson<String>(json['email']),
        role = nativeFromJson<String>(json['role']),
        createdAt = Timestamp.fromJson(json['createdAt']) {
    photoUrl = Optional.optional(nativeFromJson, nativeToJson);
    photoUrl.value = json['photoUrl'] == null
        ? null
        : nativeFromJson<String>(json['photoUrl']);
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    json['displayName'] = nativeToJson<String>(displayName);
    json['email'] = nativeToJson<String>(email);
    json['role'] = nativeToJson<String>(role);
    json['createdAt'] = createdAt.toJson();
    if (photoUrl.state == OptionalState.set) {
      json['photoUrl'] = photoUrl.toJson();
    }
    return json;
  }

  UpsertUserVariables({
    required this.id,
    required this.displayName,
    required this.email,
    required this.role,
    required this.createdAt,
    required this.photoUrl,
  });
}
