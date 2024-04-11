import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todofirebase/pages/employdata.dart';
import 'package:todofirebase/service/database.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController nameControllor = TextEditingController();
  TextEditingController ageControllor = TextEditingController();
  TextEditingController locationControllor = TextEditingController();
  Stream? EmployeStream;
  getloaded() async {
    EmployeStream = await DatabaseModel().getemployeeDetails();
    setState(() {});
  }

  @override
  void initState() {
    getloaded();
    // TODO: implement initState
    super.initState();
  }

  Widget allemployeedetails() {
    return StreamBuilder(
        stream: EmployeStream,
        builder: (context, AsyncSnapshot snapshot) {
          return snapshot.hasData
              ? ListView.builder(
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot ds = snapshot.data.docs[index];

                    return Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: Material(
                        elevation: 5,
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          margin: EdgeInsets.all(20),
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    "Name:" + ds["Name"],
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 19),
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        nameControllor.text = ds["Name"];
                                        ageControllor.text = ds["age"];
                                        locationControllor.text =
                                            ds["location"];
                                        editdata(ds["id"]);
                                      },
                                      icon: Icon(Icons.edit)),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  IconButton(
                                      onPressed: () async {
                                        await DatabaseModel()
                                            .DeleteEmployeeDetails(ds["id"]);
                                      },
                                      icon: Icon(Icons.delete))
                                ],
                              ),
                              Text(
                                "Age:" + ds["age"],
                                style: TextStyle(
                                    fontSize: 20, color: Colors.green),
                              ),
                              Text(
                                "location:" + ds["location"],
                                style: TextStyle(
                                    fontSize: 20, color: Colors.green),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  })
              : Container();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => EmployData()));
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Fluttr',
              style: TextStyle(color: Colors.blue, fontSize: 29),
            ),
            Text(
              'Firebased',
              style: TextStyle(color: Colors.orange, fontSize: 29),
            )
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(child: allemployeedetails()),
        ],
      ),
    );
  }

  Future editdata(String id) async {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Icon(Icons.cancel),
                      ),
                      Text(
                        'Edit',
                        style: TextStyle(
                          fontSize: 23,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        'details',
                        style: TextStyle(
                          fontSize: 23,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'Name',
                    style: TextStyle(
                      fontSize: 23,
                      color: Colors.black,
                    ),
                  ),
                  TextField(
                    controller: nameControllor,
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
                    controller: ageControllor,
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
                    controller: locationControllor,
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
                            Map<String, dynamic> updatedInfo = {
                              "Name": nameControllor.text.trim(),
                              "age": ageControllor.text.trim(),
                              "id": id,
                              "location": locationControllor.text.trim(),
                            };
                            await DatabaseModel()
                                .updataeEmployeeDetails(id, updatedInfo)
                                .then((value) => Navigator.of(context).pop());
                          },
                          child: Text("Update")))
                ],
              ),
            ));
  }
}
