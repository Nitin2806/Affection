import 'package:flutter/material.dart';

class WebScreenLayout extends StatelessWidget {
  const WebScreenLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Friendly Soul'),
          titleTextStyle: const TextStyle(
            color: Colors.white,
            fontSize: 35,
            fontFamily: "Billabong",
          ),
        ),
        body: const Center(child: Text("This is Web")));
  }
}
