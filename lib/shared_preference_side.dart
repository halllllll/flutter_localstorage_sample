import 'dart:math';

import 'package:flutter/material.dart';
import 'package:keychaintest/storage_manager.dart';
import 'env/env.dart';

class SharedPreferenceSide extends StatefulWidget {
  const SharedPreferenceSide({super.key});

  @override
  State<SharedPreferenceSide> createState() => _SharedPreferenceSideState();
}

class _SharedPreferenceSideState extends State<SharedPreferenceSide> {
  late StorageManager _manager;
  late int _count = 0;
  late bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    _initPrefs();
  }

  Future<void> _initPrefs() async {
    _manager = StorageManager();
    await Future.delayed(Duration(
        milliseconds: (Random().nextDouble() * 2000).toInt())); // あえて遅延ぽいのをやってる
    setState(() {
      _count = _manager.getSharedPrefIntValue(key: Env.prefcount) ?? 0;
      _isInitialized = true;
    });
  }

  void _incrementCounter() {
    setState(() {
      _count++;
      _manager.setSharedPrefIntValue(key: Env.prefcount, value: _count);
    });
  }

  void _deleteCounter() {
    setState(() {
      _manager.deleteSharedPrefValue(Env.prefcount);
      _count = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!_isInitialized) {
      return const Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("loading from localstorage"),
              SizedBox(
                height: 10,
              ),
              CircularProgressIndicator(),
            ],
          ),
        ),
      );
    }
    return Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.green, width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
        child: (Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              "shared preferences",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "count: $_count",
              style: const TextStyle(fontSize: 30),
            ),
            ElevatedButton(
              onPressed: _incrementCounter,
              child: const Text("+"),
            ),
            ElevatedButton(
                onPressed: _deleteCounter, child: const Text("delete"))
          ],
        )));
  }
}
