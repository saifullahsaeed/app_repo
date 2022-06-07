import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:login/app_constants.dart';
import 'package:login/components_app/cms_user_app_drawer.dart';
import 'package:login/components_app/cms_reusable_textfield.dart';
import 'package:login/main.dart';

import 'cms_screen_user_pending.dart';

class MakeComplaintScreen extends StatefulWidget {
  const MakeComplaintScreen({Key? key}) : super(key: key);

  @override
  State<MakeComplaintScreen> createState() => _MakeComplaintScreenState();
}

class _MakeComplaintScreenState extends State<MakeComplaintScreen> {
  //final _fAuth = FirebaseAuth.instance;
  List<String> categoryItems = ['Student', 'Faculty', 'Other'];
  String? _selectedItem;
  File? _image;
  final picker = ImagePicker();
  final TextEditingController _subController = TextEditingController();
  final TextEditingController _natureController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  Future pickImage() async {
    try {
      final pickedImage = await picker.pickImage(source: ImageSource.camera);

      setState(() {
        if (pickedImage != null) {
          _image = File(pickedImage.path);
        }
      });
    } on Exception catch (e) {
      displayMessage(e.toString());
    }
  }

  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  final _storeageRef = FirebaseStorage.instance.ref();

  Future addComplaintData(File _image) async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back,
              color: Color.fromARGB(209, 255, 245, 245)),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
        title: const Text("Make Complaint"),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[
                Color.fromARGB(226, 42, 123, 189),
                Colors.blue
              ])),
        ),
      ),
      drawer: const MyAppDrawer(),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
            child: Column(
              children: [
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                      enabledBorder: outlineInputBorder,
                      focusedBorder: outlineInputFocusBorder),
                  hint: Text(
                    'Please Select',
                    style: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context).hintColor,
                    ),
                  ),
                  items: categoryItems
                      .map(
                        (item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                          ),
                        ),
                      )
                      .toList(),
                  value: _selectedItem,
                  onChanged: (value) {
                    _selectedItem = value as String;
                  },
                ),
                ReusableTextField(
                  labelText: 'Sub Category',
                  controller: _subController,
                  obsecureText: false,
                ),
                ReusableTextField(
                  labelText: 'Nature of the Complaint',
                  controller: _natureController,
                  obsecureText: false,
                ),
                ReusableTextField(
                  labelText: 'Description',
                  controller: _descriptionController,
                  obsecureText: false,
                ),
                Center(
                  child: _image == null
                      ? ElevatedButton(
                          onPressed: () {
                            pickImage();
                          },
                          child: const Text('Pick File'),
                        )
                      : ClipRRect(
                          child: Image.file(
                            _image!,
                            scale: 5,
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                        ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    onPressed: () {
                      addComplaintData(_image as File).then((value) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const UserPendingComplainsScreens(),
                          ),
                        );
                      });
                    },
                    child: const Text('Submit'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
