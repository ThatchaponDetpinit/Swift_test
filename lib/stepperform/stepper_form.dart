import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:testswift/provider/provider_stepper.dart';

class StepperForm extends StatefulWidget {
  const StepperForm({Key? key}) : super(key: key);

  @override
  State<StepperForm> createState() => _StepperFormState();
}

class _StepperFormState extends State<StepperForm> {
  int currentStep = 0;
  bool isCompleted = false;

  TextEditingController fullName = TextEditingController();
  TextEditingController ageNumber = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController idCardNumber = TextEditingController();
  TextEditingController addressName = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stepper Form'),
      ),
      body: isCompleted
          ? build(context)
          : Theme(
              data: Theme.of(context).copyWith(
                  colorScheme: ColorScheme.light(primary: Colors.blueAccent)),
              child: Stepper(
                steps: getSteps(),
                currentStep: currentStep,
                onStepContinue: () {
                  final isLastStep = currentStep == getSteps().length - 1;

                  if (isLastStep) {
                    print('complete');
                    Navigator.pop(context);

                    context.read<ProviderStepper>().addName(fullName.text);
                    context.read<ProviderStepper>().addAge(ageNumber.text);
                    context.read<ProviderStepper>().addPhone(phoneNumber.text);
                    context
                        .read<ProviderStepper>()
                        .addIdCardList(idCardNumber.text);
                    context
                        .read<ProviderStepper>()
                        .addAddress(addressName.text);
                  } else {
                    setState(() => currentStep += 1);
                  }
                },
                onStepTapped: (step) => setState(() => currentStep = step),
                onStepCancel: currentStep == 0
                    ? null
                    : () => setState(() => currentStep -= 1),
                controlsBuilder:
                    (BuildContext context, ControlsDetails details) {
                  final isLastStep = currentStep == getSteps().length - 1;
                  return Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: details.onStepContinue,
                            child: Text(isLastStep ? 'CONFIRM' : 'NEXT'),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        if (currentStep != 0)
                          Expanded(
                            child: ElevatedButton(
                              onPressed: details.onStepCancel,
                              child: Text('CANCEL'),
                            ),
                          ),
                      ],
                    ),
                  );
                },
              ),
            ),
    );
  }

  List<Step> getSteps() => [
        Step(
            state: currentStep > 0 ? StepState.complete : StepState.indexed,
            isActive: currentStep >= 0,
            title: Text('Personal'),
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
                SizedBox(height: 10),
              ],
            )),
        Step(
            state: currentStep > 1 ? StepState.complete : StepState.indexed,
            isActive: currentStep >= 1,
            title: Text('ID card & Address'),
            content: Column(
              children: [
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
                  controller: addressName,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.home_filled),
                      labelText: 'Address',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4))),
                ),
                SizedBox(height: 10),
              ],
            )),
        Step(
            state: StepState.complete,
            isActive: currentStep >= 2,
            title: Text('Your Account'),
            content: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Name:  ${fullName.text}',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text('Age:  ${ageNumber.text}',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('Phone:  ${phoneNumber.text}',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('ID Dard:  ${idCardNumber.text}',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('Address:  ${addressName.text}',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            )),
      ];
}
