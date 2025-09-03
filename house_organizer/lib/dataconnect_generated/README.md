# dataconnect_generated SDK

## Installation
```sh
flutter pub get firebase_data_connect
flutterfire configure
```
For more information, see [Flutter for Firebase installation documentation](https://firebase.google.com/docs/data-connect/flutter-sdk#use-core).

## Data Connect instance
Each connector creates a static class, with an instance of the `DataConnect` class that can be used to connect to your Data Connect backend and call operations.

### Connecting to the emulator

```dart
String host = 'localhost'; // or your host name
int port = 9399; // or your port number
ExampleConnector.instance.dataConnect.useDataConnectEmulator(host, port);
```

You can also call queries and mutations by using the connector class.
## Queries

### GetTasks
#### Required Arguments
```dart
// No required arguments
ExampleConnector.instance.getTasks().execute();
```



#### Return Type
`execute()` returns a `QueryResult<GetTasksData, void>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

/// Result of a query request. Created to hold extra variables in the future.
class QueryResult<Data, Variables> extends OperationResult<Data, Variables> {
  QueryResult(super.dataConnect, super.data, super.ref);
}

final result = await ExampleConnector.instance.getTasks();
GetTasksData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
final ref = ExampleConnector.instance.getTasks().ref();
ref.execute();

ref.subscribe(...);
```

## Mutations

### CreateTask
#### Required Arguments
```dart
String groupHomeId = ...;
String assignedToUserId = ...;
String title = ...;
String description = ...;
Timestamp dueDate = ...;
String type = ...;
Timestamp createdAt = ...;
ExampleConnector.instance.createTask(
  groupHomeId: groupHomeId,
  assignedToUserId: assignedToUserId,
  title: title,
  description: description,
  dueDate: dueDate,
  type: type,
  createdAt: createdAt,
).execute();
```



#### Return Type
`execute()` returns a `OperationResult<CreateTaskData, CreateTaskVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

final result = await ExampleConnector.instance.createTask(
  groupHomeId: groupHomeId,
  assignedToUserId: assignedToUserId,
  title: title,
  description: description,
  dueDate: dueDate,
  type: type,
  createdAt: createdAt,
);
CreateTaskData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
String groupHomeId = ...;
String assignedToUserId = ...;
String title = ...;
String description = ...;
Timestamp dueDate = ...;
String type = ...;
Timestamp createdAt = ...;

final ref = ExampleConnector.instance.createTask(
  groupHomeId: groupHomeId,
  assignedToUserId: assignedToUserId,
  title: title,
  description: description,
  dueDate: dueDate,
  type: type,
  createdAt: createdAt,
).ref();
ref.execute();
```


### UpsertUser
#### Required Arguments
```dart
String id = ...;
String displayName = ...;
String email = ...;
String role = ...;
Timestamp createdAt = ...;
ExampleConnector.instance.upsertUser(
  id: id,
  displayName: displayName,
  email: email,
  role: role,
  createdAt: createdAt,
).execute();
```

#### Optional Arguments
We return a builder for each query. For UpsertUser, we created `UpsertUserBuilder`. For queries and mutations with optional parameters, we return a builder class.
The builder pattern allows Data Connect to distinguish between fields that haven't been set and fields that have been set to null. A field can be set by calling its respective setter method like below:
```dart
class UpsertUserVariablesBuilder {
  ...
   UpsertUserVariablesBuilder photoUrl(String? t) {
   _photoUrl.value = t;
   return this;
  }

  ...
}
ExampleConnector.instance.upsertUser(
  id: id,
  displayName: displayName,
  email: email,
  role: role,
  createdAt: createdAt,
)
.photoUrl(photoUrl)
.execute();
```

#### Return Type
`execute()` returns a `OperationResult<UpsertUserData, UpsertUserVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

final result = await ExampleConnector.instance.upsertUser(
  id: id,
  displayName: displayName,
  email: email,
  role: role,
  createdAt: createdAt,
);
UpsertUserData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
String id = ...;
String displayName = ...;
String email = ...;
String role = ...;
Timestamp createdAt = ...;

final ref = ExampleConnector.instance.upsertUser(
  id: id,
  displayName: displayName,
  email: email,
  role: role,
  createdAt: createdAt,
).ref();
ref.execute();
```


### UpsertGroupHome
#### Required Arguments
```dart
String id = ...;
String name = ...;
String adminUserId = ...;
Timestamp createdAt = ...;
ExampleConnector.instance.upsertGroupHome(
  id: id,
  name: name,
  adminUserId: adminUserId,
  createdAt: createdAt,
).execute();
```

#### Optional Arguments
We return a builder for each query. For UpsertGroupHome, we created `UpsertGroupHomeBuilder`. For queries and mutations with optional parameters, we return a builder class.
The builder pattern allows Data Connect to distinguish between fields that haven't been set and fields that have been set to null. A field can be set by calling its respective setter method like below:
```dart
class UpsertGroupHomeVariablesBuilder {
  ...
   UpsertGroupHomeVariablesBuilder address(String? t) {
   _address.value = t;
   return this;
  }
  UpsertGroupHomeVariablesBuilder description(String? t) {
   _description.value = t;
   return this;
  }

  ...
}
ExampleConnector.instance.upsertGroupHome(
  id: id,
  name: name,
  adminUserId: adminUserId,
  createdAt: createdAt,
)
.address(address)
.description(description)
.execute();
```

#### Return Type
`execute()` returns a `OperationResult<UpsertGroupHomeData, UpsertGroupHomeVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

final result = await ExampleConnector.instance.upsertGroupHome(
  id: id,
  name: name,
  adminUserId: adminUserId,
  createdAt: createdAt,
);
UpsertGroupHomeData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
String id = ...;
String name = ...;
String adminUserId = ...;
Timestamp createdAt = ...;

final ref = ExampleConnector.instance.upsertGroupHome(
  id: id,
  name: name,
  adminUserId: adminUserId,
  createdAt: createdAt,
).ref();
ref.execute();
```


### UpdateUserGroupHome
#### Required Arguments
```dart
String id = ...;
String groupHomeId = ...;
ExampleConnector.instance.updateUserGroupHome(
  id: id,
  groupHomeId: groupHomeId,
).execute();
```



#### Return Type
`execute()` returns a `OperationResult<UpdateUserGroupHomeData, UpdateUserGroupHomeVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

final result = await ExampleConnector.instance.updateUserGroupHome(
  id: id,
  groupHomeId: groupHomeId,
);
UpdateUserGroupHomeData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
String id = ...;
String groupHomeId = ...;

final ref = ExampleConnector.instance.updateUserGroupHome(
  id: id,
  groupHomeId: groupHomeId,
).ref();
ref.execute();
```


### UpdateTask
#### Required Arguments
```dart
String id = ...;
ExampleConnector.instance.updateTask(
  id: id,
).execute();
```

#### Optional Arguments
We return a builder for each query. For UpdateTask, we created `UpdateTaskBuilder`. For queries and mutations with optional parameters, we return a builder class.
The builder pattern allows Data Connect to distinguish between fields that haven't been set and fields that have been set to null. A field can be set by calling its respective setter method like below:
```dart
class UpdateTaskVariablesBuilder {
  ...
   UpdateTaskVariablesBuilder title(String? t) {
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

  ...
}
ExampleConnector.instance.updateTask(
  id: id,
)
.title(title)
.description(description)
.status(status)
.execute();
```

#### Return Type
`execute()` returns a `OperationResult<UpdateTaskData, UpdateTaskVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

final result = await ExampleConnector.instance.updateTask(
  id: id,
);
UpdateTaskData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
String id = ...;

final ref = ExampleConnector.instance.updateTask(
  id: id,
).ref();
ref.execute();
```


### DeleteTask
#### Required Arguments
```dart
String id = ...;
ExampleConnector.instance.deleteTask(
  id: id,
).execute();
```



#### Return Type
`execute()` returns a `OperationResult<DeleteTaskData, DeleteTaskVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

final result = await ExampleConnector.instance.deleteTask(
  id: id,
);
DeleteTaskData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
String id = ...;

final ref = ExampleConnector.instance.deleteTask(
  id: id,
).ref();
ref.execute();
```

