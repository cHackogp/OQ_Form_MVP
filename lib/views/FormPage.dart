import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:flutter/rendering.dart';
import 'package:image_picker/image_picker.dart';

enum q3 {
  what,
  why,
  when,
  where,
  how
} // for radio options this is the standard method

enum ImageSourceType { gallery, camera }

class FormPage extends StatefulWidget {
  const FormPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  q3? _q3 = q3
      .what; // find out what the question mark is. but anyway we're setting the initial value here so one otion is selected by default. do I need this?

  TextEditingController dateinput =
      TextEditingController(); //text editing controller for text field

  @override
  void initState() {
    dateinput.text = ""; //set the initial value of text field
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            children: <Widget>[
              Image.asset(
                "assets/images/TJX Companies Inc.png",
                scale: 3.0,
              ),
              Text(widget.title), // Do I need this?
            ],
          ),
        ),
        // Name and description of form, then the questions and answer boxes.
        body: ListView(
          children: <Widget>[
            const Text("This is the form"),
            Card(
              child: Column(
                children: const <Widget>[
                  Text("Question 1: Text Field"),
                  TextField(),
                ],
              ),
            ),
            Card(
              child: Column(
                children: <Widget>[
                  const Text("Question 2: Interger Text Field"),
                  TextField(
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                  ),
                ],
              ),
            ),
            Card(
              child: Column(
                children: <Widget>[
                  const Text("Question 3: Radio Options"),
                  RadioListTile(
                    title: const Text("what"),
                    value: q3.what,
                    groupValue: _q3,
                    onChanged: (q3? value) {
                      setState(() {
                        _q3 = value;
                      });
                    },
                  ),
                  RadioListTile(
                    title: const Text("why"),
                    value: q3.why,
                    groupValue: _q3,
                    onChanged: (q3? value) {
                      setState(() {
                        _q3 = value;
                      });
                    },
                  ),
                  RadioListTile(
                    title: const Text("when"),
                    value: q3.when,
                    groupValue: _q3,
                    onChanged: (q3? value) {
                      setState(() {
                        _q3 = value;
                      });
                    },
                  ),
                  RadioListTile(
                    title: const Text("where"),
                    value: q3.where,
                    groupValue: _q3,
                    onChanged: (q3? value) {
                      setState(() {
                        _q3 = value;
                      });
                    },
                  ),
                  RadioListTile(
                    title: const Text("how"),
                    value: q3.how,
                    groupValue: _q3,
                    onChanged: (q3? value) {
                      setState(() {
                        _q3 = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            Card(
              child: Column(
                children: <Widget>[
                  const Text("Question 4: Date type"),
                  TextField(
                    controller: dateinput,
                    readOnly: true,
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(
                              2000), //DateTime.now() - not to allow to choose before today.
                          lastDate: DateTime(2101));
                      if (pickedDate != null) {
                        print(
                            pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                        String formattedDate =
                            DateFormat('yyyy-MM-dd').format(pickedDate);
                        print(
                            formattedDate); //formatted date output using intl package =>  2021-03-16
                        //you can implement different kind of Date Format here according to your requirement

                        setState(() {
                          dateinput.text =
                              formattedDate; //set output date to TextField value.
                        });
                      } else {
                        print("Date is not selected");
                      }
                    },
                  ),
                ],
              ),
            ),
            Card(
              child: Column(
                children: const <Widget>[
                  Text("Question 5: Take Pictures"),
                  TextField(),
                ],
              ),
            ),
            Card(
              child: Column(
                children: const <Widget>[
                  Text("Question 6: Select picture from gallery"),
                  TextField(),
                ],
              ),
            ),
          ],
        ),
        // Column(
        //   children: const <Widget>[
        //     // Name and description of form, then the questions and answer boxes.
        //     Card(
        //       child: Text("Question 1"),
        //     ),
        //     Text('Form'),
        //   ],
        // ),
      ),
    );
  }
}
