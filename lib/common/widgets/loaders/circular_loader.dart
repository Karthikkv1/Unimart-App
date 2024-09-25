import 'package:flutter/material.dart';

class TCircularLoader extends StatelessWidget {
  const TCircularLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
