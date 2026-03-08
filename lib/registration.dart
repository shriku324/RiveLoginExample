import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'loginform.dart';


class RegistrationScreen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

 final TextEditingController _nameController = TextEditingController();
 final TextEditingController _userNameController = TextEditingController();
 final TextEditingController _emailController = TextEditingController();
 final TextEditingController _passwordController = TextEditingController();

  Future<void> sendRegistrationData(BuildContext context) async {
    final String mainurl = "https://web.bexova.com/api/registration";
    final Map<String,dynamic> data = {
      "name": _nameController.text,
      "email":_emailController.text,
      "username":_userNameController.text,
      "password":_passwordController.text
    };

    final response = await http.post(Uri.parse(mainurl),body: jsonEncode(data),headers: {'content-type':'application/json'});
    log(response.statusCode.toString());

    if(response.statusCode == 200){

      log("Inside status code 200");
      final Map<String,dynamic> data = jsonDecode(response.body);

      log(data.toString());

      if(data["message"]=="success"){

        log(data["message"]);

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(data["message"])));
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
         return LoginForm();
        },));
      }else{
        log(data["message"]);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(data["message"])));
      }

    }else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(data["message"])));
    }

  }


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
            key: _formKey,
            child: Padding(
              padding: const EdgeInsetsGeometry.symmetric(horizontal: 20),
              child: Column(
                children: [

                  const SizedBox(height: 15 * 2),

                  // Name edit text
                  TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      hint: Text("Enter Name"),
                      errorStyle: TextStyle(color: Colors.red.shade100,fontSize: 14),
                      labelText: "Enter your Name",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                    ),


                    //Branch creation

                    validator: (value) {
                      if(value!.isEmpty){
                        return "Field cannot be Empty";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),

                 //User name edittext
                  TextFormField(
                    controller: _userNameController,
                    decoration: InputDecoration(
                      hint: Text("Enter your User Name"),
                      labelText: "User Name",
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

                  // Password edit text
                  TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      hint: Text("Enter Password"),
                      errorStyle: TextStyle(color: Colors.red.shade100,fontSize: 14),
                      labelText: "Enter your Password",
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

                  //Email ID edittext
                  TextFormField(
                    controller: _emailController,
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

                    if(_formKey.currentState!.validate()){
                      sendRegistrationData(context);
                    }

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
