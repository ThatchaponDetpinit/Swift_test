import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:testswift/information/information_detail.dart';

import '../provider/provider_information.dart';

class InformationList extends StatefulWidget {
  const InformationList({Key? key}) : super(key: key);

  @override
  State<InformationList> createState() => _InformationListState();
}

class _InformationListState extends State<InformationList> {
  //final _formKey = GlobalKey<FormState>();
  // late String name;
  // late String age;
  // late String phone;
  // late String idCard;
  // late String birthday;

  TextEditingController fullName = TextEditingController();
  TextEditingController ageNumber = TextEditingController();
  TextEditingController birthdayDate = TextEditingController();
  TextEditingController idCardNumber = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();

  DateTime _dateTime = DateTime.now();

  _selectedBirthdayDate(BuildContext context) async {
    var _pickDate = await showDatePicker(
        context: context,
        initialDate: _dateTime,
        firstDate: DateTime(1900),
        lastDate: DateTime(2100));

    if (_pickDate != null) {
      setState(() {
        _dateTime = _pickDate;
        birthdayDate.text = DateFormat('dd-MM-yyyy').format(_pickDate);
      });
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ProviderInformation providerInformation =
        Provider.of<ProviderInformation>(context, listen: false);
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return SingleChildScrollView(
                    child: AlertDialog(
                      title: Text(
                        "Add Your Infomation",
                        textAlign: TextAlign.center,
                      ),
                      content: Column(
                        children: [
                          TextField(
                            controller: fullName,
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.text_snippet),
                                labelText: 'Name',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4))),
                          ),
                          SizedBox(height: 10),
                          TextField(
                            controller: ageNumber,
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.person_pin_sharp),
                                labelText: 'Age',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4))),
                          ),
                          SizedBox(height: 10),
                          TextField(
                            controller: birthdayDate,
                            decoration: InputDecoration(
                                prefixIcon: InkWell(
                                    onTap: () {
                                      _selectedBirthdayDate(context);
                                    },
                                    child: Icon(Icons.calendar_today)),
                                labelText: 'Birthday',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4))),
                          ),
                          SizedBox(height: 10),
                          TextField(
                            controller: idCardNumber,
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.credit_card),
                                labelText: 'ID Card',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4))),
                          ),
                          SizedBox(height: 10),
                          TextField(
                            controller: phoneNumber,
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.phone_android),
                                labelText: 'Phone',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4))),
                          ),
                        ],
                      ),
                      actions: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            FlatButton(
                                onPressed: () {
                                  setState(() {
                                    Navigator.pop(context);
                                  });
                                },
                                color: Colors.redAccent,
                                child: Text("Cancle")),
                            FlatButton(
                                onPressed: () {
                                  setState(() {
                                    context
                                        .read<ProviderInformation>()
                                        .addName(fullName.text);
                                    context
                                        .read<ProviderInformation>()
                                        .addAge(ageNumber.text);
                                    context
                                        .read<ProviderInformation>()
                                        .addBirthday(birthdayDate.text);
                                    context
                                        .read<ProviderInformation>()
                                        .addIdCardList(idCardNumber.text);
                                    context
                                        .read<ProviderInformation>()
                                        .addPhone(phoneNumber.text);
                                    Navigator.pop(context);
                                  });
                                },
                                color: Colors.green,
                                child: Text("Add")),
                          ],
                        )
                      ],
                    ),
                  );
                });
          },
          child: Icon(Icons.add),
        ),
        body: Stack(
          children: [
            Positioned(
              child: Column(children: [
                Container(
                  height: 100,
                  padding:
                      EdgeInsets.only(top: 20, bottom: 10, left: 10, right: 10),
                  decoration: BoxDecoration(
                      color: Colors.lightGreen,
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
                          margin: EdgeInsets.only(left: 100),
                          child: Text(
                            "Information",
                            style: TextStyle(fontSize: 25, color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ]),
            ),
            Positioned(
                top: 100,
                left: 10,
                right: 10,
                bottom: 10,
                child: ListView.builder(
                    itemCount:
                        context.watch<ProviderInformation>().nameList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        height: 55,
                        width: double.maxFinite,
                        margin: EdgeInsets.only(bottom: 10),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          InformationDetail()),
                                );
                              },
                              child: Container(
                                child: Icon(Icons.search),
                              ),
                            ),
                            Expanded(
                                child: Container(
                              margin: EdgeInsets.only(right: 10, left: 10),
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.grey[400]),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Name : ${context.watch<ProviderInformation>().nameList[index]}',
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.black),
                                  ),
                                  Text(
                                    'Age : ${context.watch<ProviderInformation>().ageList[index]}',
                                  ),
                                ],
                              ),
                            )),
                            Icon(
                              Icons.person_rounded,
                              color: Colors.blueAccent,
                            ),
                          ],
                        ),
                      );
                    })),
          ],
        ));
  }
}
