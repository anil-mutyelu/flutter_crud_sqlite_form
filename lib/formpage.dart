import 'package:crud_sqlite_two/personlistpage.dart';
import 'package:flutter/material.dart';
import 'database_helper.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.transparent,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Center(child: Text('FORM' ,style: TextStyle(),)),
      ),
      body: Container(
        color: Colors.cyanAccent,
        width: double.infinity,
        height: double.infinity,

        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(

                  controller:  nameController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter Name',
                      hintText: 'Enter Your Name'
                  ),
                ),
                SizedBox(height: 16),

                TextField(
                  controller:  ageController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter Age',
                      hintText: 'Enter Your Age'
                  ),
                    keyboardType: TextInputType.number,

                ),
                SizedBox(height: 16),

                TextField(
                  controller:  mobileController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter Mobile',
                      hintText: 'Enter Your Mobile'

                  ),
                    keyboardType: TextInputType.phone,

                ),
                SizedBox(height: 16),

                TextField(

                  controller:  emailController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter Email',
                      hintText: 'Enter Your Email'
                  ),
                    keyboardType: TextInputType.emailAddress,

                ),


                SizedBox(height: 16),

                ElevatedButton(

                  onPressed: () async {
                    Map<String, dynamic> row = {
                      'name': nameController.text,
                      'age': int.parse(ageController.text),
                      'mobile': mobileController.text,
                      'email': emailController.text,
                    };
                    await DatabaseHelper.instance.insert(row);

                    clearTextFields();

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DataListPage()),
                    );
                  },
                  child: Text('Save'),
                ),
                SizedBox(height: 16),
              ],
            ),
          ),
        ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {


          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DataListPage()),
          );
          },
        child:Text("Data "),
      ),

    );
  }

  void clearTextFields() {
    nameController.clear();
    ageController.clear();
    mobileController.clear();
    emailController.clear();
  }
}



