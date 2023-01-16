import 'package:flutter/material.dart';

class MyTask extends StatefulWidget {
  const MyTask({super.key});

  @override
  State<MyTask> createState() => _MyTaskState();
}

class _MyTaskState extends State<MyTask> {
  List<Map<String, dynamic>> tasks = [
    {'taskname': 'Task 1', 'desc': 'Description 1', 'isdone': false},
    {'taskname': 'Task 2', 'desc': 'Description 2', 'isdone': false},
    {'taskname': 'Task 3', 'desc': 'Description 3', 'isdone': false},
    {'taskname': 'Task 4', 'desc': 'Description 4', 'isdone': false},
    {'taskname': 'Task 5', 'desc': 'Description 5', 'isdone': false}
  ];

  final tnameController = TextEditingController();
  final tdescController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('My Task List'),
        actions: [
          PopupMenuButton(itemBuilder: (context) {
            return [
              const PopupMenuItem(child: Text('Profile')),
              const PopupMenuItem(child: Text('Attendance')),
              const PopupMenuItem(child: Text('Task')),
            ];
          })
        ],
      ),
      body: tasks.isNotEmpty
          ? ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                      // leading: CircleAvatar(
                      //   backgroundColor: Colors.grey.withOpacity(0.2),
                      //   child: const Icon(CupertinoIcons.camera),
                      // ),
                      //can be done with Inkwell
                      title: (Text(tasks[index]['taskname']!)),
                      subtitle: Text(tasks[index]['desc']!),
                      trailing: Checkbox(
                        value: tasks[index]['isdone'],
                        onChanged: (newValue) {
                          setState(() {
                            tasks[index]['isdone'] = !tasks[index]['isdone'];
                          });
                        },
                      )),
                );
              },
            )
          : const Center(
              child: Text('No User'),
            ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text('Add your new task'),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text('Enter your task name :'),
                      TextField(
                          controller: tnameController,
                          keyboardType: TextInputType.name,
                          autofocus: true,
                          textAlign: TextAlign.left,
                          // ignore: prefer_const_constructors
                          decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.fromLTRB(0, 10, 0, 5),
                            isDense: true,
                          )
                          // ),
                          ),
                      const SizedBox(
                        height: 25,
                      ),
                      const Text('Enter task description :'),
                      const SizedBox(
                        height: 5,
                      ),
                      TextField(
                        controller: tdescController,
                        maxLines: 5,
                        keyboardType: TextInputType.multiline,
                        textAlign: TextAlign.left,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(7, 5, 7, 5),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                      ),
                    ],
                  ),
                  actions: [
                    TextButton(
                        onPressed: () {
                          tasks.add({
                            'taskname': tnameController.text,
                            'desc': tdescController.text,
                            'isdone': false,
                          });
                        },
                        child: const Text('Apply')),
                    TextButton(
                        onPressed: () {
                          setState(() {});

                          tnameController.clear();
                          tdescController.clear();
                          Navigator.pop(context);
                        },
                        child: const Text('OK')),
                  ],
                );
              });
        },
        label: const Text('Add task'),
      ),
    );
  }
}
