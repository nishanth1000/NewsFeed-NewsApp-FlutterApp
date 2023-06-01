import 'package:flutter/material.dart';

class ApiLoadingScreen extends StatefulWidget {
  const ApiLoadingScreen({Key? key}) : super(key: key);

  @override
  State<ApiLoadingScreen> createState() => _ApiLoadingScreenState();
}

class _ApiLoadingScreenState extends State<ApiLoadingScreen> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        backgroundColor: Colors.white,
        color: Colors.blue,
      ),
    );
  }
}
