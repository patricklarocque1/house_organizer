part of 'example.dart';

class UpsertGroupHomeVariablesBuilder {
  String id;
  String name;
  String adminUserId;
  Timestamp createdAt;
  final Optional<String> _address =
      Optional.optional(nativeFromJson, nativeToJson);
  final Optional<String> _description =
      Optional.optional(nativeFromJson, nativeToJson);

  final FirebaseDataConnect _dataConnect;
  UpsertGroupHomeVariablesBuilder address(String? t) {
    _address.value = t;
    return this;
  }

  UpsertGroupHomeVariablesBuilder description(String? t) {
    _description.value = t;
    return this;
  }

  UpsertGroupHomeVariablesBuilder(
    this._dataConnect, {
    required this.id,
    required this.name,
    required this.adminUserId,
    required this.createdAt,
  });
  Deserializer<UpsertGroupHomeData> dataDeserializer =
      (dynamic json) => UpsertGroupHomeData.fromJson(jsonDecode(json));
  Serializer<UpsertGroupHomeVariables> varsSerializer =
      (UpsertGroupHomeVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<UpsertGroupHomeData, UpsertGroupHomeVariables>>
      execute() {
    return ref().execute();
  }

  MutationRef<UpsertGroupHomeData, UpsertGroupHomeVariables> ref() {
    UpsertGroupHomeVariables vars = UpsertGroupHomeVariables(
      id: id,
      name: name,
      adminUserId: adminUserId,
      createdAt: createdAt,
      address: _address,
      description: _description,
    );
    return _dataConnect.mutation(
        "UpsertGroupHome", dataDeserializer, varsSerializer, vars);
  }
}

class UpsertGroupHomeGroupHomeUpsert {
  String id;
  UpsertGroupHomeGroupHomeUpsert.fromJson(dynamic json)
      : id = nativeFromJson<String>(json['id']);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    return json;
  }

  UpsertGroupHomeGroupHomeUpsert({
    required this.id,
  });
}

class UpsertGroupHomeData {
  UpsertGroupHomeGroupHomeUpsert groupHome_upsert;
  UpsertGroupHomeData.fromJson(dynamic json)
      : groupHome_upsert =
            UpsertGroupHomeGroupHomeUpsert.fromJson(json['groupHome_upsert']);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['groupHome_upsert'] = groupHome_upsert.toJson();
    return json;
  }

  UpsertGroupHomeData({
    required this.groupHome_upsert,
  });
}

class UpsertGroupHomeVariables {
  String id;
  String name;
  String adminUserId;
  Timestamp createdAt;
  late Optional<String> address;
  late Optional<String> description;
  @Deprecated(
      'fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  UpsertGroupHomeVariables.fromJson(Map<String, dynamic> json)
      : id = nativeFromJson<String>(json['id']),
        name = nativeFromJson<String>(json['name']),
        adminUserId = nativeFromJson<String>(json['adminUserId']),
        createdAt = Timestamp.fromJson(json['createdAt']) {
    address = Optional.optional(nativeFromJson, nativeToJson);
    address.value = json['address'] == null
        ? null
        : nativeFromJson<String>(json['address']);

    description = Optional.optional(nativeFromJson, nativeToJson);
    description.value = json['description'] == null
        ? null
        : nativeFromJson<String>(json['description']);
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    json['name'] = nativeToJson<String>(name);
    json['adminUserId'] = nativeToJson<String>(adminUserId);
    json['createdAt'] = createdAt.toJson();
    if (address.state == OptionalState.set) {
      json['address'] = address.toJson();
    }
    if (description.state == OptionalState.set) {
      json['description'] = description.toJson();
    }
    return json;
  }

  UpsertGroupHomeVariables({
    required this.id,
    required this.name,
    required this.adminUserId,
    required this.createdAt,
    required this.address,
    required this.description,
  });
}
