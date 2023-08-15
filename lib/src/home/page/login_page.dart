import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key , required this.title});
  final String title;

  @override
  State<LoginPage> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  TextEditingController loginController = TextEditingController();
  TextEditingController passWordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 140, left: 25, right: 25),
              child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset("lib/src/Assets/logoApp.png"),
                    Text("Login" , style: TextStyle(fontSize: 35 , fontWeight: FontWeight.bold, color: Colors.green[600]),),
                    TextFormField(
                      enabled: true,
                      controller: loginController,
                      textAlign: TextAlign.start,
                      autofocus: false,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(label: Text("Login" ,style: TextStyle(fontWeight: FontWeight.bold , fontSize: 18))),
                    ),
                    TextFormField(
                      enabled: true,
                      controller: passWordcontroller,
                      textAlign: TextAlign.start,
                      autofocus: false,
                      obscureText: true,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(label: Text("Senha",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 10),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.green[400]),
                              elevation: MaterialStateProperty.all(0),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(50)))),
                          child: const Text(
                            'Entrar',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 23,
                            ),
                          ),
                        ),
                      ),
                    )
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}