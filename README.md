### Breaking Dependencies in Legacy Code: A Cheatsheet

Breaking dependencies is a crucial step in making legacy code testable and maintainable. Here is a cheatsheet summarizing various techniques for breaking dependencies, along with examples of original and refactored code for each technique.

#### 1. **Extract and Override Call**
This technique involves extracting a method call into a separate method and then overriding it in a subclass for testing.

**Original Code:**
```dart
class UserService {
  void updateUser(int userId, String newName) {
    Database.updateUser(userId, newName);
  }
}
```

**Refactored Code:**
```dart
class UserService {
  void updateUser(int userId, String newName) {
    updateDatabase(userId, newName);
  }

  void updateDatabase(int userId, String newName) {
    Database.updateUser(userId, newName);
  }
}

class TestableUserService extends UserService {
  @override
  void updateDatabase(int userId, String newName) {
    // Mock or stub implementation for testing
  }
}
```

#### 2. **Extract and Override Factory Method**
This technique involves extracting object creation into a factory method and then overriding it in a subclass for testing.

**Original Code:**
```dart
class UserService {
  void updateUser(int userId, String newName) {
    var db = Database();
    db.updateUser(userId, newName);
  }
}
```

**Refactored Code:**
```dart
class UserService {
  void updateUser(int userId, String newName) {
    var db = createDatabase();
    db.updateUser(userId, newName);
  }

  Database createDatabase() {
    return // Database(); <FAKEDATABASE>
  }
}

class TestableUserService extends UserService {
  @override
  Database createDatabase() {
    // Return a mock or stub database for testing
    return MockDatabase();
  }
}
```

#### 3. **Introduce Instance Delegator**
This technique involves introducing an instance variable to delegate the responsibility, making it easier to inject dependencies.

**Original Code:**
```dart
class UserService {
  void updateUser(int userId, String newName) {
    Database.updateUser(userId, newName);
  }
}
```

**Refactored Code:**
```dart
class UserService {
  Database database;

  UserService(this.database);

  void updateUser(int userId, String newName) {
    database.updateUser(userId, newName);
  }
}

// Usage
var userService = UserService(Database());
```

#### 4. **Parameterize Method**
This technique involves passing dependencies as parameters to methods, making it easier to inject mocks or stubs.

**Original Code:**
```dart
class UserService {
  void updateUser(int userId, String newName) {
    Database.updateUser(userId, newName);
  }
}
```

**Refactored Code:**
```dart
class UserService {
  void updateUser(int userId, String newName, Database database) {
    database.updateUser(userId, newName);
  }
}

// Usage
var userService = UserService();
userService.updateUser(1, 'John Doe', Database());
```

#### 5. **Encapsulate Global References**
This technique involves encapsulating global references in methods or classes, making it easier to replace them for testing.

**Original Code:**
```dart
class UserService {
  void updateUser(int userId, String newName) {
    GlobalDatabase.updateUser(userId, newName);
  }
}
```

**Refactored Code:**
```dart
class UserService {
  Database database;

  UserService(this.database);

  void updateUser(int userId, String newName) {
    database.updateUser(userId, newName);
  }
}

// Usage
var userService = UserService(GlobalDatabase);
```

#### 6. **Introduce Static Setter**
This technique involves introducing a static setter method to replace static dependencies for testing.

**Original Code:**
```dart
class UserService {
  static Database database = Database();

  void updateUser(int userId, String newName) {
    database.updateUser(userId, newName);
  }
}
```

**Refactored Code:**
```dart
class UserService {
  static Database database = Database();

  static void setDatabase(Database db) {
    database = db;
  }

  void updateUser(int userId, String newName) {
    database.updateUser(userId, newName);
  }
}

// Usage
UserService.setDatabase(MockDatabase());
```

### Summary
Breaking dependencies is essential for making legacy code testable. The techniques outlined above, such as Extract and Override Call, Extract and Override Factory Method, Introduce Instance Delegator, Parameterize Method, Encapsulate Global References, and Introduce Static Setter, provide various strategies to achieve this. By refactoring code to use these techniques, you can inject mocks or stubs, making it easier to write unit tests and maintain the codebase.
