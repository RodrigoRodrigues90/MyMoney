import 'package:flutter/material.dart';
import 'package:mymoney/src/components/App_Loading.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key , required this.title});
  final String title;

  @override
  State<LoginPage> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  TextEditingController loginController = TextEditingController();
  TextEditingController passWordcontroller = TextEditingController();
  bool isLoading = true;

  @override
  void initState(){
    super.initState();

    Future.delayed((const Duration(seconds: 3))).then((_) => setState((){
      isLoading = false;
    }));
  }
  @override
  Widget build(BuildContext context) {
    return isLoading
    ? const AppLoading()
    : Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 100, left: 25, right: 25),
              child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset("lib/src/Assets/logoApp.png", width: 180, fit: BoxFit.contain,),
                    Text("MyMoney" , style: TextStyle(fontSize: 30 , fontWeight: FontWeight.bold, color: Colors.green[700]),),
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
                                  MaterialStateProperty.all(Colors.lightGreen),
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