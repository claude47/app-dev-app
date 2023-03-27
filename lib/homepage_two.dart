import 'package:db_assignment_daruca/formpage_two.dart';
import 'package:flutter/material.dart';
import 'Students.dart';
import 'model.dart';
import 'database_helper.dart';
import 'profile_page.dart';
import 'widget.dart';
import 'form_page.dart';


class HomepageTwo extends StatefulWidget {
  const HomepageTwo({Key? key}) : super(key: key);

  @override
  State<HomepageTwo> createState() => _HomepageTwoState();
}

class _HomepageTwoState extends State<HomepageTwo> {
  late List<Students> data = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.lightBlueAccent,
        appBar: AppBar(
          title: Text(
            'HELLO, USER!',
            style: TextStyle(
              fontSize: 18,
              letterSpacing: 1.0,
              fontStyle: FontStyle.italic,
              shadows: [
                Shadow(
                  blurRadius: 4,
                  color: Colors.black.withOpacity(0.25),
                  offset: const Offset(2, 2),
                )
              ],
            ),
          ),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await Navigator.push(context,
                MaterialPageRoute(builder: (context) => const FormpageTwo()));
            setState(() {});
          },
          child: const Icon(Icons.add),
        ),
        body: ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              Students information = data[index];
              final remove = data[index];
              return Dismissible(
                  background: Container(color: Colors.red,),
                  key: Key(remove.toString()),
                  onDismissed: (direction) {
                    setState(() {
                      data.removeAt(index);
                    });
                  },
                  child:Card(
                      child: ListTile(
                        leading: const Icon(Icons.person),
                        contentPadding: const EdgeInsets.all(25),
                        title: Text("${information.title}"),

                        onTap: () async {
                          await Navigator.push(context,
                              MaterialPageRoute(
                                  builder: (context) => const FormpageTwo()));
                          setState(() {});
                        },
                      ))
              );
            }),
    );
  }
}
