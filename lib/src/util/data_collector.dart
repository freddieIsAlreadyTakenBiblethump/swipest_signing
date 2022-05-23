class DataCollector {

  final Map<_Data, String> _data = {};

  void setName(String name) => _data[_Data.name] = name;
  void setBirthday(String birthday) => _data[_Data.birthday] = birthday;
  void setUsername(String username) => _data[_Data.username] = username;
  void setPassword(String password) => _data[_Data.password] = password;
  void setEmail(String email) => _data[_Data.email] = email;
  void setGender(String gender) => _data[_Data.gender] = gender;

  String getName() => _data[_Data.name] ?? '';
  String getBirthday() => _data[_Data.birthday] ?? '';
  String getUsername() => _data[_Data.username] ?? '';
  String getPassword() => _data[_Data.password] ?? '';
  String getEmail() => _data[_Data.email] ?? '';
  String getGender() => _data[_Data.gender] ?? '';
}

enum _Data {
  name, birthday, username, password, email, gender
}