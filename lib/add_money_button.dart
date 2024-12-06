import 'package:flutter/material.dart';

class AddMoneyButton extends StatelessWidget {
  void Function() addMoneyFunction;
  AddMoneyButton({super.key, required this.addMoneyFunction});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Column(
        children: [
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red[700],
                  minimumSize: const Size(double.infinity, 55)),
              onPressed: addMoneyFunction,
              child: const Text('Add Money')),
        ],
      ),
    );
  }
}
