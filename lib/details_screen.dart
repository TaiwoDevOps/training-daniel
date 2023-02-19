import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const IdCardHome(),
//     );
//   }
// }

class IdCardHome extends StatelessWidget {
  TextEditingController firstname,
      lastname,
      email,
      companyId,
      staffId,
      position;
  IdCardHome(
      {super.key,
      required this.firstname,
      required this.lastname,
      required this.companyId,
      required this.email,
      required this.position,
      required this.staffId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD9D9D9),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(150),
        child: Container(
          height: 150,
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
              "Company Name",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ),
      ),

      //body
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 30,
          ),
          Center(
            child: Container(
              height: 317,
              width: 268,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: NetworkImage(
                    "https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
                  ),
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                ),
                shape: BoxShape.circle,
                border: Border.all(
                  width: 15,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),

          //TODO: let the staff name be dynamic
          //1. open the ID card generator app and enter the Company name, company email, staff ID, staff position, staff name and staff image
          //2. Generate an ID card based on the previously entered staff name
          //3. Change the profile picture based on the previously entered staff name
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 50),
            width: double.infinity,
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 10,
                ),
              ),
            ),
            child: Center(
              child: Text(
                // 'Staff name',
                '$firstname',
                style: TextStyle(fontSize: 32),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 50),
            width: double.infinity,
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 10,
                ),
              ),
            ),
            child: const Center(
              child: Text(
                "Staff ID/Position",
                style: TextStyle(fontSize: 32),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 50),
            width: double.infinity,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.zero,
                  topRight: Radius.circular(10),
                  bottomRight: Radius.zero),
              border: Border(
                bottom: BorderSide(
                  width: 5,
                ),
                top: BorderSide(
                  width: 5,
                ),
                left: BorderSide(
                  width: 5,
                ),
                right: BorderSide(
                  width: 5,
                ),
              ),
            ),
            child: const Center(
              child: Text(
                "Contact Us",
                style: TextStyle(fontSize: 32),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 50),
            width: double.infinity,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.zero,
                  topRight: Radius.circular(10),
                  bottomRight: Radius.zero),
              border: Border(
                bottom: BorderSide(
                  width: 5,
                ),
                top: BorderSide(
                  width: 5,
                ),
                left: BorderSide(
                  width: 5,
                ),
                right: BorderSide(
                  width: 5,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
