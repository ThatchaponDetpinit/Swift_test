import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 100,
            padding: EdgeInsets.only(top: 20, bottom: 10, left: 10, right: 10),
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
                  Center(
                    child: Text(
                      "TEST",
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
          GestureDetector(
            onTap: () {},
            child: Container(
                height: 100,
                margin: EdgeInsets.all(20),
                padding:
                    EdgeInsets.only(top: 20, bottom: 10, left: 10, right: 10),
                decoration: BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20))),
                child: ListTile(
                  leading: Icon(
                    Icons.play_circle_outline,
                    size: 30,
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, '/todolist');
                  },
                  title: Text(
                    'Todolist',
                    style: TextStyle(fontSize: 20),
                  ),
                )),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
                height: 100,
                margin: EdgeInsets.all(20),
                padding:
                    EdgeInsets.only(top: 20, bottom: 10, left: 10, right: 10),
                decoration: BoxDecoration(
                    color: Colors.orangeAccent,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20))),
                child: ListTile(
                  leading: Icon(
                    Icons.play_circle_outline,
                    size: 30,
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, '/calculator');
                  },
                  title: Text(
                    'Calculator',
                    style: TextStyle(fontSize: 20),
                  ),
                )),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
                height: 100,
                margin: EdgeInsets.all(20),
                padding:
                    EdgeInsets.only(top: 20, bottom: 10, left: 10, right: 10),
                decoration: BoxDecoration(
                    color: Colors.lightGreen,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20))),
                child: ListTile(
                  leading: Icon(
                    Icons.play_circle_outline,
                    size: 30,
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, '/information');
                  },
                  title: Text(
                    'Infomation',
                    style: TextStyle(fontSize: 20),
                  ),
                )),
          ),
          Container(
              height: 100,
              margin: EdgeInsets.all(20),
              padding:
                  EdgeInsets.only(top: 20, bottom: 10, left: 10, right: 10),
              decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20))),
              child: ListTile(
                leading: Icon(
                  Icons.play_circle_outline,
                  size: 30,
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/stepperList');
                },
                title: Text(
                  'Stepper Form',
                  style: TextStyle(fontSize: 20),
                ),
              )),
        ],
      ),
    );
  }
}
