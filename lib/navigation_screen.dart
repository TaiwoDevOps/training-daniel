import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'main.dart';
import 'onboarding_screen.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation Screen',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const NavigationPane(),
    );
  }
}

class NavigationPane extends StatefulWidget {
  const NavigationPane({super.key});

  @override
  State<NavigationPane> createState() => _NavigationPaneState();
}

class _NavigationPaneState extends State<NavigationPane> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD9D9D9),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(150),
        child: Container(
          height: 80,
          decoration: const BoxDecoration(
            // image: DecorationImage(image: AssetImage("../assets/image/pp.png")),
            color: Color(0xFFD9D9D9),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
            boxShadow: [
              BoxShadow(
                color: Color(0xFFFF0909),
                offset: Offset(0, 10),
              )
            ],
          ),
          child: const Center(
            child: Text(
              "Navigation Screen",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Center(
            child: Container(
              alignment: Alignment.center,
              child: Column(children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                        return OnboardingScreen();
                      }));
                    },
                    child: Text("Save PNG")),
              ]),
            ),
          ),
          Center(
            child: Container(
              alignment: Alignment.center,
              child: Column(children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                        return MyApp();
                      }));
                    },
                    child: Text("Email")),
              ]),
            ),
          ),
          Center(
            child: Container(
              alignment: Alignment.center,
              child: Column(children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                        return MyApp();
                      }));
                    },
                    child: Text("Go Back to Onboarding")),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
