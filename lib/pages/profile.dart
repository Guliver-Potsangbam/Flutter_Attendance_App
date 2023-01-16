//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:attendance/models/students_model.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key, required this.data});
  final StudentModel data;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Profile'),
      ),

      body: Center(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
            child: CircleAvatar(
              radius: 58,
              backgroundColor: Colors.grey.withOpacity(0.4),
              backgroundImage: AssetImage(widget.data.imgurl.toString()),
              //child: const Icon(CupertinoIcons.camera),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            widget.data.name.toString(),
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            widget.data.course.toString(),
            style: const TextStyle(
              color: Colors.grey,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          RatingBarIndicator(
            rating: 3.75,
            itemBuilder: (context, index) => const Icon(
              Icons.star,
              color: Colors.amber,
            ),
            itemCount: 5,
            itemSize: 20.0,
            direction: Axis.horizontal,
          ),
          const SizedBox(
            height: 35,
          ),
          _details('Address', widget.data.address),
          _details('Contact', widget.data.contact.toString()),
          _details('Email', widget.data.email),
        ]),
      ), //widget included because of stateful
    );
  }

  Container _details(key, val) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
      child: Row(children: [
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            key,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            val,
            style: const TextStyle(
              color: Colors.grey,
            ),
          ),
        ]),
      ]),
    );
  }
}
