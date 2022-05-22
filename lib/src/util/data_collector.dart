class DataCollector {

  final Map<_Data, String> _data = {};

  void setName(String name) => _data[_Data.name] = name;
  void setSurname(String surname) => _data[_Data.surename] = surname;
  void setBirthday(String birthday) => _data[_Data.birthday] = birthday;
  void setUsername(String username) => _data[_Data.username] = username;
  void setPassword(String password) => _data[_Data.password] = password;
  void setEmail(String email) => _data[_Data.email] = email;
  void setGender(String gender) => _data[_Data.gender] = gender;
}

enum _Data {
  name, surename, birthday, username, password, email, gender
}