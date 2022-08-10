import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/provider_information.dart';

class InformationDetail extends StatefulWidget {
  InformationDetail({Key? key}) : super(key: key);

  @override
  State<InformationDetail> createState() => _InformationDetailState();
}

class _InformationDetailState extends State<InformationDetail> {
  //final _formKey = GlobalKey<FormState>();
  // late String fullName;
  // late String ageNumber;
  // late String phoneNumber;
  // late String idCardNumber;
  // late String birthdayDate;
  TextEditingController fullName = TextEditingController();
  TextEditingController ageNumber = TextEditingController();
  TextEditingController birthdayDate = TextEditingController();
  TextEditingController idCardNumber = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();

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
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(40),
                          bottomRight: Radius.circular(40))),
                  child: Container(
                    margin: EdgeInsets.only(
                      top: 15,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                        Text(
                          "Account Information",
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        GestureDetector(
                          onTap: () {
                            var nav = Navigator.of(context);
                            nav.pop();
                            nav.pop();
                          },
                          child: Icon(
                            Icons.home,
                            color: Colors.white,
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
            top: 100,
            left: 10,
            right: 10,
            bottom: 0,
            child: Container(
              margin: EdgeInsets.only(top: 15),
              //color: Colors.red,
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: ListView.builder(
                    itemCount:
                        context.watch<ProviderInformation>().nameList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        height: 250,
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
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'name : ${context.watch<ProviderInformation>().nameList[index]}',
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.black),
                                        ),
                                        Text(
                                          'Age : ${context.watch<ProviderInformation>().ageList[index].toString()}',
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.black),
                                        ),
                                        Text(
                                          'Date : ${context.watch<ProviderInformation>().birthdayList[index]}',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black),
                                        ),
                                        Text(
                                          'ID-Card : ${context.watch<ProviderInformation>().idCardList[index]}',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black),
                                        ),
                                        Text(
                                          'Phone : ${context.watch<ProviderInformation>().phoneList[index]}',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black),
                                        ),
                                      ],
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
          ),
        ],
      ),
    );
  }
}
