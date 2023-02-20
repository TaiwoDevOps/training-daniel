import 'package:company_id_card/id_card_screens/create_staff_input.dart';
import 'package:company_id_card/widget/id_card_appbar.dart';
import 'package:flutter/material.dart';

class CreateIDInputScreen extends StatefulWidget {
  const CreateIDInputScreen({super.key});

  @override
  State<CreateIDInputScreen> createState() => _CreateIDInputScreenState();
}

class _CreateIDInputScreenState extends State<CreateIDInputScreen> {
  final _companyName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD9D9D9),
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: IdCardAppBar(headerTitle: 'Company ID-Card generator'),
      ),
      floatingActionButton: GestureDetector(
        onTap: () {
          if (_companyName.text.isEmpty) {
            print('Enter company name');
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return CreateStaffIDInputScreen(
                    companyName: _companyName.text,
                  );
                },
              ),
            );
          }
        },
        child: Container(
          height: 60,
          width: 200,
          decoration: BoxDecoration(
            color: const Color(0xFFFF0909),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'Continue',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "kindly enter the Company name you'd like to generate ID Cards for",
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: _companyName,
              decoration: InputDecoration(
                helperText: "Enter company's name",
                label: const Text(
                  "Company's name",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                ),
                helperStyle: const TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade600),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 2,
                    color: Colors.grey.shade400,
                  ),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 2,
                    color: Colors.grey.shade400,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
