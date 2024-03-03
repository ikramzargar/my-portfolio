import 'package:flutter/material.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60),
          child: const Row(
            children: [
              Text('Portfolio'),
              Spacer(),
              Text('Home'),
              SizedBox(width: 20,),
              Text('About'),
              SizedBox(width: 20,),
              Text('Skills'),
              SizedBox(width: 20,),
              Text('Projects'),
              SizedBox(width: 20,),
              Text('Contact'),
            ],
          ),
        ),
      ),
    );
  }
}
