
import 'package:flutter/material.dart';



class RegistationScreen extends StatelessWidget {
  const RegistationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(),
      body:Center(
        child: Container(
          alignment: Alignment.center,
          width: 350,
          padding: const EdgeInsets.only(bottom: 15),

          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Form(
            child: Padding(
              padding: const EdgeInsetsGeometry.symmetric(horizontal: 20),
              child: Column(
                children: [
                  // flutter.Image.asset(
                  //   'assets/image.jpg',
                  //   width: 200,
                  //   height: 200,
                  // ),


                  const SizedBox(height: 15 * 2),
                  TextFormField(
                    decoration: InputDecoration(
                      hint: Text("Enter emil ID"),
                      errorStyle: TextStyle(color: Colors.red.shade100,fontSize: 14),
                      labelText: "Enter your login ID",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                    ),

 // something  new

                    validator: (value) {
                      if(value!.isEmpty){
                        return "Field cannot be Empty";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    decoration: InputDecoration(
                      hint: Text("Enter your password"),
                      labelText: "Password",
                      errorStyle: TextStyle(color: Colors.red.shade100,fontSize: 14),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                    ),
                    validator: (value) {
                      if(value!.isEmpty){
                        return "Field cannot be Empty";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    decoration: InputDecoration(
                      hint: Text("Enter emil ID"),
                      errorStyle: TextStyle(color: Colors.red.shade100,fontSize: 14),
                      labelText: "Enter your login ID",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                    ),



                    validator: (value) {
                      if(value!.isEmpty){
                        return "Field cannot be Empty";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    decoration: InputDecoration(
                      hint: Text("Enter emil ID"),
                      errorStyle: TextStyle(color: Colors.red.shade100,fontSize: 14),
                      labelText: "Enter your login ID",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                    ),



                    validator: (value) {
                      if(value!.isEmpty){
                        return "Field cannot be Empty";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),

                  ElevatedButton(onPressed: () {

                  }, child: Text("Register"))

                ],
              ),
            ),

          ),
        ),
      ),

    );
  }
}
