import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testswift/provider/provider_stepper.dart';

class ShowListStepper extends StatefulWidget {
  const ShowListStepper({Key? key}) : super(key: key);

  @override
  State<ShowListStepper> createState() => _ShowListStepperState();
}

class _ShowListStepperState extends State<ShowListStepper> {
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
                          margin: EdgeInsets.only(left: 90),
                          child: Text(
                            "Stepper Form",
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
            bottom: 540,
            child: FlatButton(
                color: Colors.green[300],
                onPressed: () {
                  Navigator.pushNamed(context, '/stepperForm');
                },
                child: Text("Add+",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                        color: Colors.white))),
          ),
          Positioned(
            top: 135,
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
                    itemCount: context.watch<ProviderStepper>().nameList.length,
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
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    'Name : ${context.watch<ProviderStepper>().nameList[index]}',
                                  ),
                                  Text(
                                    'Age : ${context.watch<ProviderStepper>().ageList[index]}',
                                  ),
                                  Text(
                                    'PhoneNumber : ${context.watch<ProviderStepper>().phoneList[index]}',
                                  ),
                                  Text(
                                    'ID Card : ${context.watch<ProviderStepper>().idCardList[index]}',
                                  ),
                                  Text(
                                    'Address : ${context.watch<ProviderStepper>().addressList[index]}',
                                  ),
                                ],
                              ),
                            ))
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
