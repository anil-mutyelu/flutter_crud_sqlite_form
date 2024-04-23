import 'package:crud_sqlite_two/personlistpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'database_helper.dart';

class EditDataPage extends StatefulWidget {
  final Map<String, dynamic> row;

  EditDataPage({required this.row});

  @override
  _EditDataPageState createState() => _EditDataPageState();
}

class _EditDataPageState extends State<EditDataPage> {
  TextEditingController idController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameController.text = widget.row['name'];
    ageController.text = widget.row['age'].toString();
    mobileController.text = widget.row['mobile'];
    emailController.text = widget.row['email'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Person Edit Data'),
      ),
      body: Container(
        color: Colors.cyanAccent,
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [

              SizedBox(height: 16),

              TextField(

                controller:  nameController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter Name',
                    hintText: 'Update Your Name'
                ),
                keyboardType: TextInputType.text,

              ),
              const SizedBox(height: 16),

              TextField(

                controller:  ageController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter Age',
                    hintText: 'Update Your Age'
                ),
                keyboardType: TextInputType.number,

              ),
              const SizedBox(height: 16),

              TextField(

                controller:  mobileController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter Mobile',
                    hintText: 'Update Your Mobile'
                ),
                keyboardType: TextInputType.number,

              ),
              const SizedBox(height: 16),

              TextField(

                controller:  emailController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter Email',
                    hintText: 'Update Your Email'
                ),
                keyboardType: TextInputType.emailAddress,

              ),

              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () async {
                  try {

                    Map<String, dynamic> updatedRow = {
                      '_id': widget.row['_id'],
                      'name': nameController.text,
                      'age': int.parse(ageController.text),
                      'mobile': mobileController.text,
                      'email': emailController.text,
                    };

                    await DatabaseHelper.instance.update(updatedRow);

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DataListPage()),
                    );

                  } catch (e) {
                    print('Error updating data: $e');
                    // Handle the error, such as showing a dialog or snackbar to the user
                  }


                },


                child: const Text('Update Data'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
