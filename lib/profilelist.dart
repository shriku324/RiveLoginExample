import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rivelogin/models/models.dart';

class Profilelist extends StatelessWidget {
  const Profilelist({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Center(
          child: Text(
            "Home",
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        leading: IconButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return CupertinoAlertDialog(
                  title: Text("Exit App"),
                  content: Text("Do you want to exit this app?"),
                  actions: [
                    TextButton(onPressed: () {

                      Navigator.pop(context);

                    }, child: Text("No")),

                    TextButton(
                      onPressed: () {
                        SystemNavigator.pop();
                      },
                      child: Text("Yes", style: TextStyle(color: Colors.red)),
                    ),
                  ],
                );
              },
            );
          },
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.white,
        ),
      ),
      body: ListView.builder(
        itemCount: individualList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.grey.shade200,
              ),
              child: ListTile(
                contentPadding: EdgeInsets.all(10),
                title: Text(
                  individualList[index].name,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                subtitle: Text(
                  individualList[index].message,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: Colors.grey,
                  ),
                ),
                trailing: Text("11:48 AM"),
                leading: Stack(
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage(individualList[index].image),
                    ),
                    individualList[index].isOnline == true
                        ? Positioned(
                            bottom: 0,
                            right: 0,
                            child: CircleAvatar(
                              radius: 5,
                              backgroundColor: Colors.green,
                            ),
                          )
                        : SizedBox(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
