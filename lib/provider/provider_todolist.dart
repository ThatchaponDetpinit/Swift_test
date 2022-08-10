import 'package:flutter/material.dart';

class ProviderTodolist with ChangeNotifier {
  List<String> _nameList = [];
  List<String> get nameList => _nameList;

  void addName(String item) {
    _nameList.add(item);
    notifyListeners();
  }

  List<String> _dateList = [];
  List<String> get dateList => _dateList;

  void addDate(String item) {
    _dateList.add(item);
    notifyListeners();
  }

  List<String> _descriptionList = [];
  List<String> get descriptionList => _descriptionList;

  void addDescription(String item) {
    _descriptionList.add(item);
    notifyListeners();
  }

  void removeItem(int index) {
    nameList.removeAt(index);
    notifyListeners();
  }
}
