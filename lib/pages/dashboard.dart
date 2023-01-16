import 'package:attendance/pages/student_list.dart';
import 'package:attendance/pages/my_task.dart';
import 'package:flutter/material.dart';
import 'package:attendance/fake_data.dart';
import '../models/students_model.dart';
import '../models/user_model.dart';

import '../services/api_service.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final totalDays = 100;
  int noOfPresent = 55;

  ApiService obj = ApiService();

  List<StudentModel> studentObject = [];

  @override
  void initState() {
    studentObject = fakedata.map((e) => StudentModel.fromJson(e)).toList();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Dashboard'),
        actions: [
          PopupMenuButton(itemBuilder: (context) {
            return [
              PopupMenuItem(
                child: const Text('Student List'),
                onTap: () async {
                  final navigator = Navigator.of(context);
                  await Future.delayed(Duration.zero);
                  navigator.push(MaterialPageRoute(
                      builder: (_) => StudentList(
                            data: studentObject,
                          )));
                },
              ),
              const PopupMenuItem(child: Text('Attendance')),
              const PopupMenuItem(child: Text('Task')),
            ];
          })
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 25, 20, 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text(
                            'My Attendance',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            '${((noOfPresent / totalDays) * 100).round()} %',
                            style: const TextStyle(
                              color: Colors.green,
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextButton(
                            style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                                minimumSize: const Size(0, 0),
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                alignment: Alignment.centerRight),
                            onPressed: () {},
                            child: const Text(
                              'View',
                              style: TextStyle(
                                color: Colors.blue,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Text(
                            '$noOfPresent/$totalDays',
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 25, 20, 25),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "Today's Task",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              TextButton(
                                style: TextButton.styleFrom(
                                    padding: EdgeInsets.zero,
                                    minimumSize: const Size(0, 0),
                                    tapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                    alignment: Alignment.centerRight),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const MyTask()));
                                },
                                child: const Text(
                                  'View all',
                                  style: TextStyle(
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 15, 0, 0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'Create a popup menu',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Create a popup menu in the appbar',
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                                // Text(
                                //   userObject[0].name.toString(),
                                //   style: TextStyle(
                                //     color: Colors.grey,
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 25, 20, 25),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Text(
                                'Students',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextButton(
                                style: TextButton.styleFrom(
                                    padding: EdgeInsets.zero,
                                    minimumSize: const Size(0, 0),
                                    tapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                    alignment: Alignment.centerLeft),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => StudentList(
                                                data: studentObject,
                                              )));
                                },
                                child: const Text(
                                  'View all',
                                  style: TextStyle(
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 90,
                        width: double.infinity,
                        //color: Colors.blue,
                        child: studentsDP(),
                      )
                    ],
                  ),
                ),
              ),
              // ListView.builder(
              //   itemCount: userObject.length,
              //   shrinkWrap: true,
              //   itemBuilder: ((context, index) {
              //     return ListTile(
              //       title: Text(userObject[index].email!),
              //     );
              //   }),
              // ),
              FutureBuilder(
                builder: (ctx, snapshot) {
                  // Checking if future is resolved or not
                  if (snapshot.connectionState == ConnectionState.done) {
                    // If we got an error
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(
                          '${snapshot.error} occurred',
                          style: const TextStyle(fontSize: 18),
                        ),
                      );

                      // if we got our data
                    } else if (snapshot.hasData) {
                      // Extracting data from snapshot object
                      var data = snapshot.data as List<UserModel>;
                      return ListView.builder(
                        itemCount: data.length,
                        shrinkWrap: true,
                        itemBuilder: ((context, index) {
                          return ListTile(
                            // tileColor: Colors.red,
                            title: Center(child: Text(data[index].name)),
                            subtitle:
                                Center(child: Text(data[index].department)),
                          );
                        }),
                      );
                    }
                  }

                  // Displaying LoadingSpinner to indicate waiting state
                  // ignore: prefer_const_constructors
                  return Center(
                    child: const CircularProgressIndicator(),
                  );
                },

                // Future that needs to be resolved
                // inorder to display something on the Canvas
                future: obj.fetchData(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget studentsDP() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: ListView.builder(
        // itemExtent: 120.0,  //fix area for the items
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: studentObject.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
            child: CircleAvatar(
              radius: 35,
              backgroundImage:
                  AssetImage(studentObject[index].imgurl.toString()),
            ),
          );
        },
      ),
    );
  }
}
