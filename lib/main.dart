import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testswift/calculator/show_calculator.dart';
import 'package:testswift/information/information_list.dart';
import 'package:testswift/provider/provider_information.dart';
import 'package:testswift/provider/provider_stepper.dart';
import 'package:testswift/provider/provider_todolist.dart';
import 'package:testswift/screen/my_home_page.dart';
import 'package:testswift/stepperform/show_list_stepper.dart';
import 'package:testswift/stepperform/stepper_form.dart';
import 'package:testswift/todolist/show_todolist.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProviderStepper()),
        ChangeNotifierProvider(create: (_) => ProviderInformation()),
        ChangeNotifierProvider(create: (_) => ProviderTodolist()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => MyHomePage(),
        '/stepperList': (context) => ShowListStepper(),
        '/stepperForm': (context) => StepperForm(),
        '/information': (context) => InformationList(),
        '/todolist': (context) => ShowTodolist(),
        '/calculator': (context) => ShowCalculator(),
      },
    );
  }
}
