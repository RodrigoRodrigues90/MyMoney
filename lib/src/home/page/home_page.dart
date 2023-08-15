import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:mymoney/src/home/controler/home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
  @observable
  late HomeController homeController;
  
  @override
  void initState(){
    super.initState();
    homeController = HomeController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        backgroundColor: Colors.lightGreen[400],
        leading: const Icon(Icons.verified_user),
        actions: [IconButton(onPressed: (){}, icon: const  Icon(Icons.logout))],
      ),
      body: Observer(builder: (_){ 
        return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(padding: const EdgeInsets.all(42.0),
            child: Image.network("https://cdn.pixabay.com/photo/2017/01/11/08/31/icon-1971128_1280.png")),
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '${homeController.counter}',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ],
        ),
      );
      }),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 40),
        child: FloatingActionButton(
          backgroundColor: Colors.lightGreen[400],
          onPressed: homeController.incrementCounter,
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
      ),
      bottomSheet: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          shape: BoxShape.rectangle,
        ),
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.lightGreen,
          ),
          onPressed: homeController.reset,
          child: const Text("reset",
              style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold, fontFamily: AutofillHints.telephoneNumberDevice,
              )
          ),
      ),
      ),
  );
  }
}
