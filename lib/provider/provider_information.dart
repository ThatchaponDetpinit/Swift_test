import 'package:flutter/material.dart';

class ProviderInformation with ChangeNotifier {
  List<String> _nameList = [];
  List<String> get nameList => _nameList;

  void addName(String item) {
    _nameList.add(item);
    notifyListeners();
  }

  List<String> _ageList = [];
  List<String> get ageList => _ageList;

  void addAge(String item) {
    _ageList.add(item);
    notifyListeners();
  }

  List<String> _birthdayList = [];
  List<String> get birthdayList => _birthdayList;

  void addBirthday(String item) {
    _birthdayList.add(item);
    notifyListeners();
  }

  List<String> _idCardList = [];
  List<String> get idCardList => _idCardList;

  void addIdCardList(String item) {
    _idCardList.add(item);
    notifyListeners();
  }

  List<String> _phoneList = [];
  List<String> get phoneList => _phoneList;

  void addPhone(String item) {
    _phoneList.add(item);
    notifyListeners();
  }
}
