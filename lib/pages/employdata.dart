import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';
import 'package:todofirebase/service/database.dart';
import 'package:fluttertoast/fluttertoast.dart';

class EmployData extends StatefulWidget {
  const EmployData({super.key});

  @override
  State<EmployData> createState() => _EmployDataState();
}

class _EmployDataState extends State<EmployData> {
  TextEditingController name = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController location = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              "EmplolyeeForm",
              style: TextStyle(fontSize: 29, color: Colors.blue),
            ),
            Text(
              "Form",
              style: TextStyle(color: Colors.orange, fontSize: 29),
            )
          ],
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 20, top: 30, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name',
              style: TextStyle(
                fontSize: 23,
                color: Colors.black,
              ),
            ),
            TextField(
              controller: name,
              decoration: InputDecoration(
                hintText: 'Enter Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Age',
              style: TextStyle(
                fontSize: 23,
                color: Colors.black,
              ),
            ),
            TextField(
              controller: age,
              decoration: InputDecoration(
                hintText: 'Enter Age',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Location',
              style: TextStyle(
                fontSize: 23,
                color: Colors.black,
              ),
            ),
            TextField(
              controller: location,
              decoration: InputDecoration(
                hintText: 'Enter Location',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: ElevatedButton(
                  onPressed: () async {
                    String id = randomAlphaNumeric(10);
                    Map<String, dynamic> employinfo = {
                      "Name": name.text.trim(),
                      "age": age.text.trim(),
                      "id": id,
                      "location": location.text.trim(),
                    };
                    await DatabaseModel()
                        .adddEmployDetail(employinfo, id)
                        .then((value) {
                      Fluttertoast.showToast(
                          msg: "Employee details added sussfully",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    });
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'Add',
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
