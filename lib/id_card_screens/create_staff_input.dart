import 'package:company_id_card/data/staff_data.dart';
import 'package:company_id_card/id_card_screens/preview_id.dart';
import 'package:company_id_card/widget/id_card_appbar.dart';
import 'package:company_id_card/widget/id_card_input_field.dart';
import 'package:flutter/material.dart';

class CreateStaffIDInputScreen extends StatefulWidget {
  const CreateStaffIDInputScreen({super.key, required this.companyName});
  final String companyName;

  @override
  State<CreateStaffIDInputScreen> createState() =>
      _CreateStaffIDInputScreenState();
}

class _CreateStaffIDInputScreenState extends State<CreateStaffIDInputScreen> {
  final _staffName = TextEditingController();
  final _staffEmail = TextEditingController();
  final _staffPhone = TextEditingController();
  final _staffID = TextEditingController();
  final _companyEmail = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD9D9D9),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: IdCardAppBar(headerTitle: widget.companyName),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              const SizedBox(
                height: 50,
              ),
              const Text(
                "kindly enter the staff information that you'd like to generate ID Card for",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              IdCardInputField(
                input: _staffName,
                helperText: "Enter staff name",
                labelText: "Staff name",
                textInputType: TextInputType.name,
                validator: validateString(),
              ),
              const SizedBox(
                height: 20,
              ),
              IdCardInputField(
                input: _staffEmail,
                helperText: "Enter staff email",
                labelText: "Staff email",
                textInputType: TextInputType.emailAddress,
                validator: validateString(),
              ),
              const SizedBox(
                height: 20,
              ),
              IdCardInputField(
                input: _staffPhone,
                helperText: "Enter staff phone number",
                labelText: "Staff phone number",
                textInputType: TextInputType.phone,
                validator: validateString(),
              ),
              const SizedBox(
                height: 20,
              ),
              IdCardInputField(
                input: _staffID,
                helperText: "Enter staff ID",
                labelText: "Staff ID",
                textInputType: TextInputType.number,
                validator: validateString(),
              ),
              const SizedBox(
                height: 20,
              ),
              IdCardInputField(
                input: _companyEmail,
                helperText: "Enter Company email",
                labelText: "Company's email",
                textInputType: TextInputType.emailAddress,
                validator: validateString(),
              ),
              const SizedBox(
                height: 60,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState != null &&
                        _formKey.currentState!.validate()) {
                      StaffData staffData = StaffData(
                        companyName: widget.companyName,
                        staffName: _staffName.text,
                        email: _staffEmail.text,
                        phoneNumber: _staffPhone.text,
                        staffID: _staffID.text,
                        companyEmail: _companyEmail.text,
                      );

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return IdCardPreviewScreen(
                              staffData: staffData,
                            );
                          },
                        ),
                      );
                    } else {
                      print("Enter staff information");
                    }
                  },
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                    Color(0xFFFF0909),
                  )),
                  child: const FittedBox(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      child: Text(
                        "SUBMIT",
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  String? Function(String?) validateString() {
    return (String? value) {
      if (value == null || value.isEmpty && value.length < 6) {
        return "Field is required.";
      }
      return null;
    };
  }
}
