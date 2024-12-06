import 'package:billionaireapp/add_money_button.dart';
import 'package:billionaireapp/balance_view.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

//state are the information that can be changed

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double balance = 0;

  void addMoney() async {
    setState(() {
      balance = balance + 500;
    });

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('balance', balance);

    print('$balance');
  }

  @override
  void initState() {
    // TODO: implement initState
    loadBalane();
  }

  void loadBalane() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      balance = prefs.getDouble('balance') ?? 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Billionaire App'),
        ),
        body: Container(
          padding: const EdgeInsets.all(20),
          color: Colors.blueGrey[700],
          height: double.infinity,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BalanceView(balance: balance),
              // Expanded(
              //   flex: 9,
              //   child: Column(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       Text('Bank Balance: '),
              //       SizedBox(height: 20),
              //       Text('$balance'),
              //       // OutlinedButton(
              //       //     onPressed: loadBalane, child: Text('Load Balance'))
              //     ],
              //   ),
              // ),
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
              // Expanded(
              //   flex: 1,
              //   child: Column(
              //     children: [
              //       ElevatedButton(
              //           style: ElevatedButton.styleFrom(
              //               backgroundColor: Colors.red[700],
              //               minimumSize: const Size(double.infinity, 55)),
              //           onPressed: addMoney,
              //           child: const Text('Add Money')),
              //     ],
              //   ),
              // )
              AddMoneyButton(addMoneyFunction: addMoney)
            ],
          ),
        ),
      ),
    );
  }
}
