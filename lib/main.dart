import 'package:attendance/pages/dashboard.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Attendance Record',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'NIELIT, IMPHAL'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String username = '';
  String password = '';

  bool visibility = true;

  String errorUsernameMsg = '';
  String errorPasswordMsg = '';

  final nameController = TextEditingController();
  final pwdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          height: 450,
          width: 320,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                  color: Color.fromARGB(255, 56, 56, 56),
                  blurRadius: 25.0,
                  spreadRadius: 1,
                  offset: Offset(
                    5,
                    2,
                  ),
                )
              ]),
          //alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                'Login',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                    fontSize: 25),
              ),
              SizedBox(
                width: 270,
                child: Column(
                  children: [
                    TextField(
                      controller: nameController,
                      keyboardType: TextInputType.name,
                      autofocus: true,
                      textAlign: TextAlign.left,
                      // ignore: prefer_const_constructors
                      decoration: InputDecoration(
                        hintText: 'Enter username',
                        prefixIcon: const Icon(
                          Icons.person,
                          size: 21,
                        ),
                        counterText: errorUsernameMsg,
                        counterStyle: const TextStyle(color: Colors.red),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                      ),

                      onTap: () {
                        setState(() {
                          errorUsernameMsg = '';
                        });
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextField(
                      controller: pwdController,
                      obscureText: visibility,
                      keyboardType: TextInputType.visiblePassword,
                      textAlign: TextAlign.left,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.lock,
                          size: 17,
                        ),
                        hintText: 'Enter password',
                        suffixIcon: visibility
                            ? IconButton(
                                onPressed: () {
                                  setState(() {
                                    visibility = !visibility;
                                  });
                                },
                                icon: const Icon(Icons.visibility),
                              )
                            : IconButton(
                                onPressed: () {
                                  setState(() {
                                    visibility = !visibility;
                                  });
                                },
                                icon: const Icon(Icons.visibility_off),
                              ),
                        counterText: errorPasswordMsg,
                        counterStyle: const TextStyle(color: Colors.red),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          errorPasswordMsg = '';
                        });
                      },
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                            //side: BorderSide(color: Colors.red),
                          ),
                        ),
                      ),
                      onPressed: () {
                        if (nameController.text == username &&
                            pwdController.text == password) {
                          //showDialog(
                          //context: context,
                          //builder: (context) {
                          //return AlertDialog(
                          //title: Text("Authenticated"),
                          //);
                          //});
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Dashboard(),
                              ));
                        } else if (nameController.text == username) {
                          setState(() {
                            errorPasswordMsg = "Invalid";
                          });
                        } else {
                          setState(() {
                            errorUsernameMsg = "Invalid";
                          });
                        }
                      },
                      child: const Text('Login'),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  const Text('New User? Create Account'),
                  RichText(
                    text: TextSpan(
                        text: 'Sign in',
                        style: const TextStyle(color: Colors.blue),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Dashboard(),
                                ));
                          }),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
