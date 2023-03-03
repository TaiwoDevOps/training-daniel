import 'package:company_id_card/core/network.dart';
import 'package:company_id_card/data/get_company_id_res.dart';
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
  bool isLoading = true;
  final NetworkHandler _networkHandler = NetworkHandler();
  final _staffName = TextEditingController();
  final _staffEmail = TextEditingController();
  final _staffPhone = TextEditingController();
  final _staffID = TextEditingController();
  final _companyEmail = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  GetCompanyIdResponse? getCompanyIdResponse;

  @override
  void initState() {
    var id = widget.companyName.split(":").last;
    _networkHandler.getCompanyDataById(int.parse(id.trim())).then((value) {
      if (value is GetCompanyIdResponse) {
        getCompanyIdResponse = value;
      } else {
        print("This is what happened ======> $value");
      }
      setState(() => isLoading = false);
    });
    super.initState();
  }

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
              Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey, width: 2),
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "ID: ${getCompanyIdResponse?.payload?.id ?? ''}",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                        Visibility(
                          visible: isLoading,
                          child: const CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "Course type name : ${getCompanyIdResponse?.payload?.courseTypeName ?? ''}",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      "Date created : ${getCompanyIdResponse?.payload?.dateCreated?.split("T").first ?? ''}",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      "Is Active : ${getCompanyIdResponse?.payload?.isActive ?? ''}",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 12,
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
