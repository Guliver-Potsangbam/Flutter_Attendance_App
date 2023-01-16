//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//import 'package:attendance/fake_data.dart';
import 'package:attendance/pages/profile.dart';
import 'package:attendance/pages/my_task.dart';

import '../models/students_model.dart';

class StudentList extends StatefulWidget {
  const StudentList({super.key, required this.data});
  final List<StudentModel> data;

  @override
  State<StudentList> createState() => _StudentListState();
}

class _StudentListState extends State<StudentList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.grey.withOpacity(0.9),
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Student List'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const MyTask()));
            },
            child: const Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
              child: Text(
                'My Task',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 19,
                ),
              ),
            ),
          )
        ],
      ),
      body: widget.data.isNotEmpty
          ? ListView.builder(
              itemCount: widget.data.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    //tileColor: Colors.transparent,
                    leading: CircleAvatar(
                      backgroundColor: Colors.green.withOpacity(0.8),
                      backgroundImage:
                          AssetImage(widget.data[index].imgurl.toString()),
                      //child: const Icon(CupertinoIcons.camera),
                    ),
                    //can be done with Inkwell
                    title: (Text(widget.data[index].name.toString())),
                    subtitle: Text(widget.data[index].present.toString()),
                    trailing: const Icon(Icons.more_vert),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ProfilePage(data: widget.data[index]),
                          ));
                    },
                  ),
                );
              },
            )
          : const Center(
              child: Text('No User'),
            ),
    );
  }
}
