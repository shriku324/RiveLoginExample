import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';
import 'package:rivelogin/profilelist.dart';
import 'package:rivelogin/registration.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<StatefulWidget> createState() => LoginFormState();
}

class LoginFormState extends State<LoginForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late final fileLoader = FileLoader.fromAsset(
    "assets/teddy.riv",
    riveFactory: Factory.rive,
  );
  RiveWidgetController? _controller;

  void _setHandsUp(bool value) {
    _controller?.stateMachine?.boolean('isHandsUp')?.value = value;
  }

  void _loginTriggers(bool success) {
    _controller?.stateMachine?.boolean('isChecking')?.value = false;
    if (success) {
      _controller?.stateMachine?.trigger('trigSuccess')?.fire();
    } else {
      _controller?.stateMachine?.trigger('trigFail')?.fire();
    }
  }

  void eyeball(val) {
    _controller?.stateMachine?.boolean('isChecking')?.value = true;
    _controller?.stateMachine.number('numLook')?.value = val.length.toDouble();
  }

  @override
  void dispose() {
    _controller?.dispose();
    fileLoader.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Rive"),
        backgroundColor: const Color(0xff63adf5),
      ),
      backgroundColor: const Color(0xffd6e2ea),
      body: Center(
        child: Column(
          children: [

            SizedBox(
              height: 200,
              width: 200,
              child: RiveWidgetBuilder(
                fileLoader: fileLoader,
                stateMachineSelector: StateMachineSelector.byIndex(0),

                builder: (context, state) => switch (state) {
                  RiveLoading() => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  RiveFailed() => ErrorWidget.withDetails(
                    message: state.error.toString(),
                    error: FlutterError(state.error.toString()),
                  ),
                  RiveLoaded() => Builder(
                    builder: (_) {
                      _controller = state.controller;
                      return RiveWidget(
                        controller: state.controller,
                        fit: Fit.cover,
                      );
                    },
                  ),
                },
              ),
            ),

            Container(
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
                      // flutter.Image.asset(
                      //   'assets/image.jpg',
                      //   width: 200,
                      //   height: 200,
                      // ),


                      const SizedBox(height: 15 * 2),
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

                        onTap: () {
                          _setHandsUp(false);
                        },
                        onChanged: (value) {
                          eyeball(value);
                        },
                        validator: (value) {
                          if(value!.isEmpty){
                            return "Field cannot be Empty";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: _passwordController,
                        onTap: () {
                          _setHandsUp(true);
                        },

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

                      const SizedBox(height: 15),

                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //remember me checkbox
                          Row(
                            children: [
                              Checkbox(value: false, onChanged: (value) {}),
                              const Text("Remember me"),
                            ],
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xffb04863),
                            ),

                            onPressed: () {

                              print('Email: "${_emailController.text}"');
                              print('Password: "${_passwordController.text}"');
                              _setHandsUp(false);
                              if(_formKey.currentState!.validate()) {
                                if (_emailController.text == "abc" &&
                                    _passwordController.text == "abc") {
                                  _loginTriggers(true);
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                                    return Profilelist();
                                  },));
                                } else {
                                  _loginTriggers(false);
                                }
                              }
                            },
                            child: const Text("Login"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

              ),
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Don't have an account?"),
            const SizedBox(width: 10,),
            InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder:(context) => RegistationScreen(),)
                  );
                },
                child: const Text("Sign up")
            ),
          ],
        ),
      ),
    );
  }
}
