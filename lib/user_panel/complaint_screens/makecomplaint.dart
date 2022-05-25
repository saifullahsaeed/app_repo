import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:login/components_app/app_drawer.dart';

import 'file_list.dart';

class makecomplaint extends StatefulWidget {
  const makecomplaint({Key? key}) : super(key: key);

  @override
  State<makecomplaint> createState() => _makecomplaintState();
}

class _makecomplaintState extends State<makecomplaint> {
  FilePickerResult? result;
  PlatformFile? file;
  // var _currencies = [
  //   "Food",
  //   "Transport",
  //   "Personal",
  //   "Shopping",
  //   "Medical",
  //   "Rent",
  //   "Movie",
  //   "Salary"
  // ];
  // var _currentSelectedValue = "";

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
            padding: const EdgeInsets.all(10),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Flexible(
                    child: TextFormField(
                      style: const TextStyle(
                          color: Color.fromARGB(255, 19, 18, 18)),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Categories",
                        labelText: "Enter Your Categories",
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  const Flexible(
                    child: TextField(
                      style: TextStyle(color: Color.fromARGB(255, 19, 18, 18)),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Sub Categories",
                        hintText: "Enter a Sub-Catergories",
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [],
                ),
              ),
              const TextField(
                style: TextStyle(color: Color.fromARGB(255, 19, 18, 18)),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Nature of Complaint",
                  hintText: "Regarding to...",
                ),
              ),
              const TextField(
                style: TextStyle(color: Color.fromARGB(255, 19, 18, 18)),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Description",
                  hintText: "Feel free to write. Your complaint is secure.",
                  //contentPadding: EdgeInsets.symmetric(vertical: 50),
                ),
              ),
              const TextField(
                style: TextStyle(color: Color.fromARGB(255, 19, 18, 18)),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Regarding File",
                  hintText: "Regarding to...",
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    pickFiles();
                  },
                  child: const Text('Pick File')),
            ]),
          ),
        ),
      ),
    );
  }

  void pickFiles() async {
    result = await FilePicker.platform.pickFiles(allowMultiple: true);
    if (result == null) return;

    loadSelectedFile(result!.files);
  }

  void loadSelectedFile(List<PlatformFile> files) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => FileList(files: files, onOpenedFile: viewFile)));
  }

  void viewFile(PlatformFile file) {
    //OpenFile.open(file.path);
  }
}
