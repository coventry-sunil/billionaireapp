import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  void buttonFunction() {
    print("Button is pressed!!");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Billionaire App"),
        ),
        body: Container(
          padding: const EdgeInsets.all(20),
          color: Colors.blueGrey[700],
          height: double.infinity,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Expanded(
                flex: 9,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Bank Balance: "),
                    SizedBox(height: 20),
                    Text("0")
                  ],
                ),
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Expanded(
              //       child: Container(
              //         color: Colors.red,
              //         child: Text("One"),
              //       ),
              //     ),
              //     Expanded(
              //       child: Container(
              //         color: Colors.green,
              //         child: Text("Two"),
              //       ),
              //     ),
              //     Expanded(
              //       child: Container(
              //         color: Colors.blue,
              //         child: Text("Three"),
              //       ),
              //     )
              //   ],
              // ),
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red[700],
                            minimumSize: const Size(double.infinity, 55)),
                        onPressed: buttonFunction,
                        child: const Text("Add Money")),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
