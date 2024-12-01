import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:dicoding/members_list.dart';

//design inspired by https://www.behance.net/gallery/211443573/RentEase/modules/1202001553
class AddMember extends StatelessWidget {
  String _name = '';
  int _age = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Member', style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xFF212121),
      ),
      backgroundColor: Color(0xFF212121),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                labelText: 'Name',
                labelStyle: TextStyle(color: Colors.white),
                focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)) //code inspired from https://stackoverflow.com/a/49600357
              ),
              style: TextStyle(color: Colors.white),
              onChanged: (String value) {
                _name = value;
              },
              cursorColor: Colors.white,

            ),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Age',
                labelStyle: TextStyle(color: Colors.white),
                focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)) //code inspired from https://stackoverflow.com/a/49600357
            ),
              style: TextStyle(color: Colors.white),
              onChanged: (String value){
                _age = int.parse(value);
              },
              cursorColor: Colors.white,

            ),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF9dff3b), ),
              child: const Text('Submit', style: TextStyle(color: Color(0xFF2a2a2a))),
              onPressed: () {
                membersList.add(Member(name: _name, age: _age ));
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}