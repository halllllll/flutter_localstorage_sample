import 'package:flutter/material.dart';
import 'package:keychaintest/secure_storage_side.dart';
import 'package:keychaintest/shared_preference_side.dart';

class DivideRoot extends StatefulWidget {
  const DivideRoot({super.key});

  @override
  State<DivideRoot> createState() => _DivideRootState();
}

class _DivideRootState extends State<DivideRoot> {
  @override
  Widget build(BuildContext context) {
    return const IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(child: SharedPreferenceSide()),
          VerticalDivider(
            thickness: 2,
            color: Colors.pink,
            width: 40,
          ),
          Expanded(child: SecureStorageSide()),
        ],
      ),
    );
  }
}
