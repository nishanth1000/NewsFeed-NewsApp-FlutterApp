import 'dart:async';
import 'package:flutter/material.dart';

class Buffer extends StatefulWidget {
  const Buffer({Key? key}) : super(key: key);

  @override
  State<Buffer> createState() => _BufferState();
}

class _BufferState extends State<Buffer> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, '/home');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff212121),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: RotatedBox(
                    quarterTurns: -1,
                    child: Text(
                      'Howdy  !!!',
                      style: TextStyle(
                        color: Colors.blue[300]?.withOpacity(0.5),
                        fontSize: 35,
                        fontFamily: 'RubikVinyl',
                      ),
                    ),
                  ),
                ),
              ],
            ),

            Column(
              children: const [
                Text(
                  'News Feed',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 50,
                    fontFamily: 'RubikVinyl',
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(22.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  RotatedBox(
                    quarterTurns: -1,
                    child: Column(
                      children: [
                        Text(
                          'Nishanth',
                          style: TextStyle(
                            color: Colors.blue[300]?.withOpacity(0.5),
                            fontSize: 35,
                            fontFamily: 'RubikVinyl',
                          ),
                        ),
                        Text(
                          'Kanagaraj',
                          style: TextStyle(
                            color: Colors.blue[300]?.withOpacity(0.5),
                            fontSize: 35,
                            fontFamily: 'RubikVinyl',
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
