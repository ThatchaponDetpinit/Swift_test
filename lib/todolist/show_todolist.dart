import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../provider/provider_todolist.dart';

class ShowTodolist extends StatefulWidget {
  const ShowTodolist({Key? key}) : super(key: key);

  @override
  State<ShowTodolist> createState() => _ShowTodolistState();
}

class _ShowTodolistState extends State<ShowTodolist> {
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  DateTime _dateTime = DateTime.now();

  _selectedDate(BuildContext context) async {
    var _pickDate = await showDatePicker(
        context: context,
        initialDate: _dateTime,
        firstDate: DateTime(1900),
        lastDate: DateTime(2100));

    if (_pickDate != null) {
      setState(() {
        _dateTime = _pickDate;
        dateController.text = DateFormat('dd-MM-yyyy').format(_pickDate);
      });
    }
  }

  _addFormDialog(BuildContext context) {
    ProviderTodolist providerTodolist =
        Provider.of<ProviderTodolist>(context, listen: false);
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (param) {
          return AlertDialog(
            title: Text("Add Activity"),
            content: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.local_activity),
                        labelText: 'Activity',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4))),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: dateController,
                    decoration: InputDecoration(
                        prefixIcon: InkWell(
                            onTap: () {
                              _selectedDate(context);
                            },
                            child: Icon(Icons.date_range)),
                        labelText: 'Date',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4))),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: descriptionController,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.edit),
                        labelText: 'Description',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4))),
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                  color: Colors.redAccent,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Cancel")),
              FlatButton(
                  color: Colors.blueAccent,
                  onPressed: () {
                    providerTodolist.addName(nameController.text);
                    providerTodolist.addDescription(descriptionController.text);
                    providerTodolist.addDate(dateController.text);
                    Navigator.pop(context);
                    nameController.text = '';
                    descriptionController.text = '';
                    dateController.text = '';
                  },
                  child: Text("Add")),
            ],
          );
        });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            child: Column(
              children: [
                Container(
                  height: 100,
                  padding:
                      EdgeInsets.only(top: 20, bottom: 10, left: 10, right: 10),
                  decoration: BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(40),
                          bottomRight: Radius.circular(40))),
                  child: Container(
                    margin: EdgeInsets.only(top: 15, left: 10),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.arrow_back_ios_outlined,
                            color: Colors.white,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 110),
                          child: Text(
                            "Todolist",
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 110,
            left: 280,
            right: 10,
            bottom: 520,
            child: GestureDetector(
              onTap: () {
                print('click');
                _addFormDialog(context);
              },
              child: Container(
                height: 50,
                width: 100,
                decoration: BoxDecoration(
                    color: Colors.lightBlueAccent,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        topLeft: Radius.circular(30),
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30))),
                child: Container(
                    margin: EdgeInsets.only(left: 35, top: 15),
                    child: Text(
                      'Add +',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    )),
              ),
            ),
          ),
          Positioned(
            top: 160,
            left: 10,
            right: 10,
            bottom: 10,
            child: Container(
              margin: EdgeInsets.only(top: 15),
              //color: Colors.red,
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: ListView.builder(
                    itemCount:
                        context.watch<ProviderTodolist>().nameList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        height: 100,
                        width: double.maxFinite,
                        margin: EdgeInsets.only(bottom: 10),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.only(right: 10, left: 10),
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.grey[400]),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          'Activity : ${context.watch<ProviderTodolist>().nameList[index]}',
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.black),
                                        ),
                                        Text(
                                          'Date : ${context.watch<ProviderTodolist>().dateList[index].toString()}',
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.black),
                                        ),
                                        Text(
                                          'Description : ${context.watch<ProviderTodolist>().descriptionList[index]}',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black38),
                                        ),
                                      ],
                                    ),
                                    Consumer<ProviderTodolist>(
                                      builder: (_, provider, __) => IconButton(
                                          onPressed: () {
                                            provider.removeItem(index);
                                          },
                                          icon: Icon(
                                            Icons.delete,
                                            color: Colors.red,
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
              ),
            ),
          )
        ],
      ),
    );
  }
}
