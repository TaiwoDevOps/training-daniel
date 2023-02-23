import 'dart:io';
import 'dart:typed_data';

import 'package:company_id_card/data/staff_data.dart';
import 'package:company_id_card/widget/id_card_appbar.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

class IdCardPreviewScreen extends StatefulWidget {
  const IdCardPreviewScreen({super.key, required this.staffData});
  final StaffData staffData;

  @override
  State<IdCardPreviewScreen> createState() => _IdCardPreviewScreenState();
}

class _IdCardPreviewScreenState extends State<IdCardPreviewScreen> {
  final ImagePicker _picker = ImagePicker();
  //Create an instance of ScreenshotController
  ScreenshotController screenshotController = ScreenshotController();
  Uint8List? _imageFile;
  List<XFile>? _imageFileList;

  void _setImageFileListFromFile(XFile? value) {
    _imageFileList = value == null ? null : <XFile>[value];
    Navigator.maybePop(context);
  }

  _displayPickImageDialog(ImageSource source) async {
    _imageFileList = [];
    try {
      final XFile? pickedFile = await _picker.pickImage(
        source: source,
      );
      setState(() {
        _setImageFileListFromFile(pickedFile);
      });
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Screenshot(
      controller: screenshotController,
      child: Scaffold(
        backgroundColor: const Color(0xFFD9D9D9),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(150),
          child: IdCardAppBar(
            headerTitle: widget.staffData.companyName,
          ),
        ),

        //body
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            Center(
              child: Container(
                height: 150,
                width: 130,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    border: Border.all(
                      width: 4,
                    ),
                    borderRadius: BorderRadius.circular(8)),
                child: _imageFileList == null || _imageFileList!.isEmpty
                    ? GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return SizedBox(
                                  height: 200,
                                  child: Column(
                                    children: [
                                      const SizedBox(
                                        height: 16,
                                      ),
                                      const Text(
                                        "Select an option",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      ListTile(
                                        leading: const Icon(
                                          Icons.photo_album_outlined,
                                        ),
                                        title: const Text(
                                          'Gallery',
                                        ),
                                        onTap: () {
                                          _displayPickImageDialog(
                                              ImageSource.gallery);
                                        },
                                      ),
                                      ListTile(
                                        leading: const Icon(
                                          Icons.photo_camera_outlined,
                                        ),
                                        title: const Text(
                                          'Camera',
                                        ),
                                        onTap: () {
                                          _displayPickImageDialog(
                                              ImageSource.camera);
                                        },
                                      ),
                                    ],
                                  ),
                                );
                              });
                        },
                        child: const Icon(
                          Icons.person_add,
                          color: Colors.black,
                          size: 35,
                        ),
                      )
                    : Image.file(
                        File(_imageFileList![0].path),
                        fit: BoxFit.cover,
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
            _displayStaffInfo('Staff name: ', widget.staffData.staffName),
            _displayStaffInfo('Staff Email: ', widget.staffData.email),
            _displayStaffInfo(
                'Staff phone number: ', widget.staffData.phoneNumber),
            _displayStaffInfo('Staff ID: ', widget.staffData.staffID),
            _displayStaffInfo('Company email: ', widget.staffData.companyEmail),
            const Spacer(),
            Center(
              child: TextButton(
                child: Text(
                  'Save ID Card',
                  style: TextStyle(
                    color: Colors.amber.shade900,
                  ),
                ),
                onPressed: () async {
                  var val = await screenshotController.capture();
                  setState(() {
                    _imageFile = val;
                  });
                  if (val != null) {
                    final directory = await getApplicationDocumentsDirectory();
                    final imagePath = await File(
                            '${directory.path}/${DateTime.now().toIso8601String()}.png')
                        .create();
                    var path = await imagePath.writeAsBytes(val);
                    print("the screenshot saved path ${path.path}");
                  }
                },
              ),
            ),
            const SizedBox(
              height: 60,
            ),
          ],
        ),
      ),
    );
  }

  Container _displayStaffInfo(String title, String desc) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 4),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
      ),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Text(
            desc,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
