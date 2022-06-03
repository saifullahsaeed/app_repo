import 'package:flutter/material.dart';
import 'package:login/components_app/cms_reusable_textfield.dart';

class ComplainViewScreen extends StatefulWidget {
  const ComplainViewScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ComplainViewScreen> createState() => _ComplainViewScreenState();
}

class _ComplainViewScreenState extends State<ComplainViewScreen> {
  String? selectedItem;
  final TextEditingController _subController = TextEditingController();
  final TextEditingController _natureController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  List<String> categoryItems = ['Student', 'Faculty', 'Other'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              children: [
                const Text('User Data'),
                DropdownButtonFormField<String>(
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
                  value: selectedItem,
                  onChanged: (value) {
                    selectedItem = value as String;
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
                SizedBox(
                  width: MediaQuery.of(context).size.width / 100 * 70,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text('Submit'),
                  ),
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
