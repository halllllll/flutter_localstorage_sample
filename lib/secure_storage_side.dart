import 'dart:math';

import 'package:flutter/material.dart';
import 'package:keychaintest/storage_manager.dart';

class SecureStorageSide extends StatefulWidget {
  const SecureStorageSide({super.key});

  @override
  State<SecureStorageSide> createState() => _SecureStorageSideState();
}

class _SecureStorageSideState extends State<SecureStorageSide> {
  late StorageManager _manager;
  late int _count = 0;
  late bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    _initSecureStorage();
  }

  Future<void> _initSecureStorage() async {
    _manager = StorageManager();
    await Future.delayed(Duration(
        milliseconds: (Random().nextDouble() * 2000).toInt())); // あえて遅延ぽいのをやってる
    var tmpCount =
        await _manager.getSecureStorageValue(key: "secstorage_count") ?? "0";
    _count = int.tryParse(tmpCount) ?? 0;

    setState(() {
      _isInitialized = true;
    });
  }

  void _incrementCounter() {
    setState(() {
      _count++;
      _manager.setSecureStorageValue(
          key: "secstorage_count", value: _count.toString());
    });
  }

  void _deleteCounter() {
    setState(() {
      _manager.deleteSecureStorageValue(key: "secstorage_count");
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
              Text("loading from secure storage"),
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
            border: Border.all(color: Colors.blue, width: 2),
            borderRadius: BorderRadius.circular(10)),
        child: (Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              "secure storage",
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
