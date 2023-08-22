import 'dart:async';

class CreateAccountBloc {
  final _nameController = StreamController<String>();
  final _emailController = StreamController<String>();
  final _dobController = StreamController<String>();
  Stream<String> get nameStream => _nameController.stream;
  Stream<String> get emailStream => _emailController.stream;
  Stream<String> get dobStream => _dobController.stream;

  bool isValidInfo(String name, String email, String dob) {
    if (name.length < 6) {
      _nameController.sink.addError("Name is too short");
      return false;
    }
    _nameController.sink.add("");
    if (!email.contains("@")) {
      _emailController.sink.addError("Email is invalid");
      return false;
    }
    _emailController.sink.add("");
    if (dob.isEmpty) {
      _dobController.sink.addError("Date of birth is invalid");
      return false;
    }
    _dobController.sink.add("");
    return true;
  }

  updateName(String text) {
    text.isEmpty ? _nameController.sink.addError("Name is invalid") : _nameController.sink.add(text);
  }

  updateEmail(String text) {
    text.isEmpty ? _emailController.sink.addError("Email is invalid") : _emailController.sink.add(text);
  }

  updateDob(String text) {
    text.isEmpty ? _dobController.sink.addError("Date of birth is invalid") : _dobController.sink.add(text);
  }

  dispose() {
    _nameController.close();
    _emailController.close();
    _dobController.close();
  }
}
