import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {

  final controllerName = TextEditingController();
  final controllerAge = TextEditingController();
  final controlleremail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: ListView(
          children: [
            TextField(
              controller: controllerName,
              decoration: const InputDecoration(
                  hintText: 'Name'
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            TextField(
              controller: controllerAge,
              decoration: const InputDecoration(
                  hintText: 'age'
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            TextField(
              controller: controlleremail,
              decoration: InputDecoration(
                  hintText: 'Email'
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            ElevatedButton(
                onPressed: () async {
                 await FirebaseFirestore.instance.collection('users').add({
                    'name': controllerName.text.toString(),
                    'email': controlleremail.text.toString(),
                    'age': controllerAge.text.toString(),
                  });
                  print('data added');
                },
                child: Text('Create')),
          ],
        ),
      ),
    );
  }
}