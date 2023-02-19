import 'package:flutter/material.dart';

import 'details_screen.dart';
import 'main.dart';
import 'navigation_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Onboarding Screen',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const OnboardingPane(),
    );
  }
}

class OnboardingPane extends StatefulWidget {
  const OnboardingPane({super.key});

  @override
  State<OnboardingPane> createState() => _OnboardingPaneState();
}

class _OnboardingPaneState extends State<OnboardingPane> {
  TextEditingController _firstname = TextEditingController();
  TextEditingController _lastname = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _companyname = TextEditingController();
  TextEditingController _staffId = TextEditingController();
  TextEditingController _position = TextEditingController();

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
              "Onboarding Screen",
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
                        return MyApp();
                      }));
                    },
                    child: Text("Go to Home")),
              ]),
            ),
          ),
          Center(
            child: Container(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: TextField(
                      controller: _firstname,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Enter First Name"),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: TextField(
                      controller: _lastname,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Enter Last Name"),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: TextField(
                      controller: _lastname,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Company Name"),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: TextField(
                      controller: _lastname,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), labelText: "Email"),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: TextField(
                      controller: _lastname,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), labelText: "Position"),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: TextField(
                      controller: _lastname,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), labelText: "StaffID"),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => IdCardHome(
                                  firstname: _firstname,
                                  lastname: _lastname,
                                  companyId: _companyname,
                                  email: _email,
                                  position: _position,
                                  staffId: _staffId,
                                )));
                      },
                      child: Text('Go Details Page'))
                ],
              ),
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
                        return NavigationScreen();
                      }));
                    },
                    child: Text("Go To Navigations")),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
