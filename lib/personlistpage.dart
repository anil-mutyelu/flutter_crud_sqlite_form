import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'database_helper.dart';
import 'editdata.dart';

class DataListPage extends StatefulWidget {
  @override
  _DataListPageState createState() => _DataListPageState();
}

class _DataListPageState extends State<DataListPage> {
  List<Map<String, dynamic>> data = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    var result = await DatabaseHelper.instance.queryAll();
    setState(() {
      data = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Person List'),
      ),
      body: Container(
        color: Colors.brown,
        width: double.infinity,
        height: double.infinity,
        child: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            return ListTile(

              title:Container(
                color: Colors.cyanAccent,

                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Name: ${data[index]['name']}'),
                      Text('Age: ${data[index]['age']}'),
                      Text('Mobile: ${data[index]['mobile']}'),
                      Text('Email: ${data[index]['email']}'),

                    ]
                ),
              ),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Options'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          editData(data[index]);
                        },
                        child: Text('Edit'),
                      ),
                      TextButton(

                        onPressed: () async {
                          Navigator.pop(context);
                          await DatabaseHelper.instance.delete(data[index]['_id']);

                          getData();
                        },

                        child: Text('Delete'),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context); // Go back when FAB is pressed
        },
        child: Icon(Icons.arrow_back),
      ),
    );
  }

  Future<void> editData(Map<String, dynamic> row) async {
    await DatabaseHelper.instance.update(row);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditDataPage(row: row),
      ),
    );
  }
}