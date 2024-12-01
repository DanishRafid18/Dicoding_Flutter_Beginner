import 'package:dicoding/add_member.dart';
import 'package:flutter/material.dart';
import 'package:dicoding/members_list.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

//design inspired by https://www.behance.net/gallery/211443573/RentEase/modules/1202001553
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Members List', style: TextStyle(color: Colors.white),),
        backgroundColor: Color(0xFF212121),
      ),
      backgroundColor: Color(0xFF212121),
      body: Column(
        children: <Widget>[
          // ListView within Expanded
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                final Member member = membersList[index];
                return Card(
                  color: Color(0xFF9DFF3B),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Name: ${member.name}",
                                style: const TextStyle(fontSize: 20.0, color: Color(0xFF2a2a2a)),
                              ),
                              Text("Age: ${member.age}", style: const TextStyle(fontSize: 20.0, color: Color(0xFF2a2a2a))),
                            ],
                          ),
                        ),
                      ),
                      IconButton(onPressed: (){
                        membersList.removeAt(index);
                        setState(() {});
                      }, icon: const Icon(Icons.delete))
                    ],
                  ),
                );
              },
              itemCount: membersList.length,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push( context, MaterialPageRoute(builder: (context) => AddMember()), ).then((value) => setState(() {})); //code inspired from this comment https://github.com/flutter/flutter/issues/36530#issuecomment-669823844
              },
              style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF9dff3b)),
              child: const Text('Add Member', style: TextStyle(color: Color(0xFF2a2a2a)),),
            ),
          ),
        ],
      ),
    );
  }
}
