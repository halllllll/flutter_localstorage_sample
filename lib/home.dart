import 'package:flutter/material.dart';
import 'package:keychaintest/divide_root.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sample"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Container(
        padding: const EdgeInsets.all(30),
        child: const Column(
          children: [
            Text(
              "shared preferenceとsecure storageの挙動確認サンプル",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(
              height: 30,
            ),
            DivideRoot(),
          ],
        ),
      ),
    );
  }
}
